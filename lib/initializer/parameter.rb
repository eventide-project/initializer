module Initializer
  class Parameter
    attr_reader :name
    attr_reader :visibility
    attr_reader :default

    def initialize(name, visibility)
      @name = name
      @visibility = visibility
    end

    def default_value(value)
      @default = value
    end

    def definition
      if default
        return "#{name}=#{default.code_fragment}"
      else
        return name
      end
    end

    def self.build(name, visibility, default=nil)
      instance = new(name, visibility)

      default ||= :no_default_value

      unless default == :no_default_value
        default = build_default_value(default)
        instance.default_value(default)
      end

      instance
    end

    def self.build_default_value(default_value)
      result = default_value

      unless default_value.respond_to?(:code_fragment)
        if [String, Symbol].include?(result.class)
          result = StringDefaultValue.new(result.to_s)
        else
          result = Statement.new(result)
        end
      end
      result
    end

    def visibility?(visibility)
      self.visibility == visibility
    end

    def reader?
      visibility? :reader
    end

    def writer?
      visibility? :writer
    end

    def accessor?
      visibility? :accessor
    end

    def no_accessor?
      visibility? :no_accessor
    end

    class StringDefaultValue
      def initialize(value)
        @value = value
      end

      def code_fragment
        "'#{@value}'"
      end
    end

    class Statement
      attr_reader :code_fragment

      def initialize(code_fragment)
        @code_fragment = code_fragment
      end
    end
  end
end
