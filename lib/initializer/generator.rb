module Initializer
  class Generator
    DEFAULT_VISIBILITY = :reader

    attr_reader :target_class
    attr_reader :parameters

    def initialize(target_class, parameters)
      @target_class = target_class
      @parameters = parameters
    end

    def self.build(target_class, parameters)
      parameters, options = separate_parameters(parameters)
      parameters = NormalizeParameters.(parameters, options.visibility)
      instance = new target_class, parameters
      instance
    end

    def self.call(target_class, parameters)
      instance = build target_class, parameters
      instance.call
    end

    def call
      define_attributes
      Define.(target_class, parameters)
    end

    def self.separate_parameters(parameters)
      options = { :visibility => DEFAULT_VISIBILITY }
      options = parameters.pop if options?(parameters)
      options.extend InitializerOptions

      return parameters, options
    end

    def self.options?(parameters)
      parameters.last.is_a? Hash
    end

    def define_attributes
      parameters.each do |p|
        ::Attribute::Define.(target_class, p.name, p.visibility)
      end
    end

    class Define
      attr_reader :target_class
      attr_reader :parameters

      def initialize(target_class, parameters)
        @target_class = target_class
        @parameters = parameters
      end

      def self.call(target_class, parameters)
        parameters = parameters.map do |parameter|
          parameter.extend InitializerParameter
        end
        instance = new target_class, parameters
        instance.()
      end

      def call
        target_class.class_eval(initializer_definition)
      end

      def variable_assignment_statements
        variable_assignments = parameters.inject("") do |assignments, parameter|
          "#{assignments}#{parameter.assignment_statement}\n"
        end
        variable_assignments
      end

      def parameter_list
        parameter_names = parameters.map { |p| p.name }
        parameter_names = parameter_names.join(", ")
        parameter_names
      end

      def initializer_definition
        "
          def initialize(#{parameter_list})
            #{variable_assignment_statements}
          end
        "
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

    class NormalizeParameters
      attr_reader :parameters
      attr_reader :default_visibility

      def initialize(parameters, default_visibility)
        @parameters = parameters
        @default_visibility = default_visibility
      end

      def self.call(parameters, default_visibility)
        instance = new parameters, default_visibility
        instance.()
      end

      def call
        @parameters = parameters.map do |p|
          normalize p
        end
        parameters
      end

      def normalize(parameter)
        if parameter.is_a? Symbol
          return Parameter.new parameter, default_visibility
        else
          return parameter
        end
      end
    end

    module InitializerOptions
      def visibility
        self[:visibility]
      end
    end
  end
end
