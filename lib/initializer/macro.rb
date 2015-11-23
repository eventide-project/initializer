module Initializer
  class Macro
    DEFAULT_VISIBILITY = :reader

    attr_reader :target_class
    attr_reader :parameters

    def initialize(target_class, parameters)
      @target_class = target_class
      @parameters = parameters
    end

    def self.build(target_class, parameters)
      parameters, options = separate_parameters(parameters)
      options.extend InitializerOptions
      parameters = NormalizeParameters.normalize(parameters, options.visibility)
      instance = new target_class, parameters
      instance
    end

    def self.generate_definitions(target_class, parameters)
      instance = build target_class, parameters
      instance.generate_definitions
    end

    def self.separate_parameters(parameters)
      options = { :default => DEFAULT_VISIBILITY }
      options = parameters.pop if options?(parameters)

      return parameters, options
    end

    def self.options?(parameters)
      parameters.last.is_a? Hash
    end

    def generate_definitions
      define_attributes
      InitializerDefinition.define_initializer(target_class, parameters)
    end

    def define_attributes
      parameters.each do |p|
        Attribute.define target_class, p.name, p.visibility
      end
    end

    class InitializerDefinition
      attr_reader :target_class
      attr_reader :parameters

      def initialize(target_class, parameters)
        @target_class = target_class
        @parameters = parameters
      end

      def self.define_initializer(target_class, parameters)
        parameters = parameters.map do |parameter|
          parameter.extend InitializerParameter
        end
        instance = new target_class, parameters
        instance.define_initializer
      end

      def define_initializer
        body = build_initializer_definition
        target_class.class_eval body
      end

      def variable_assignment_statements
        variable_assignments = parameters.inject("") do |assignments, parameter|
          "#{assignments}#{parameter.assignment_statement}\n"
        end
        variable_assignments
      end

      def parameter_definitions
        parameter_names = parameters.map{ |item| item.argument_definition }.to_a
        parameter_names = parameter_names.join(", ")
        parameter_names
      end

      def build_initializer_definition
        body =
<<CTOR
        def initialize(#{parameter_definitions})
          #{variable_assignment_statements}
        end
CTOR
      end

      module InitializerParameter
        def variable_name
          "@#{name}"
        end

        def assignment_statement
          "#{variable_name} = #{name}"
        end
      end
    end
  end

  module InitializerOptions
    def visibility
      self[:default]
    end
  end

  class Attribute
    attr_reader :target_class
    attr_reader :name
    attr_reader :visibility

    def initialize(target_class, name, visibility)
      @target_class = target_class
      @name = name
      @visibility = visibility
    end

    def self.define(target_class, name, visibility)
      # instance = new target_class, name, visibility
      # instance.define
      ::Attribute::Define.(target_class, name, visibility)
    end

    def define
      define_getter if [:reader, :accessor].include? visibility
      define_setter if [:writer, :accessor].include? visibility
    end

    def define_getter
      name = self.name
      target_class.send :define_method, name do
        instance_variable_get("@#{name}")
      end
    end

    def define_setter
      name = self.name
      target_class.send :define_method, "#{name}=" do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  class NormalizeParameters
    attr_reader :parameters
    attr_reader :default_visibility

    def initialize(parameters, default_visibility)
      @parameters = parameters
      @default_visibility = default_visibility
    end

    def self.normalize(parameters, default_visibility)
      instance = new parameters, default_visibility
      instance.normalize
      instance.parameters
    end

    def normalize
      @parameters = parameters.map do |p|
        normalize_parameter p
      end
    end

    def normalize_parameter(parameter)
      if parameter.is_a? Symbol
        return Parameter.new parameter, default_visibility
      else
        return parameter
      end
    end
  end
end
