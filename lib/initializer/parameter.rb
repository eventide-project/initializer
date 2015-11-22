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

    def argument_definition
      return "#{@name} = #{default.code_fragment}" if @default

      return @name
    end

    def self.build_default_value(value)
      result = value

      unless result.respond_to?(:code_fragment)
        if [String, Symbol].include?(result.class)
          result = StringDefaultValue.new(result.to_s)
        else
          result = Statement.new(result)
        end
      end
      result
    end

    def self.build(name, visibility, default = NO_DEFAULT_VALUE)
      instance = new(name, visibility)

      unless default.eql?(NO_DEFAULT_VALUE)
        default = build_default_value(default)
        instance.default_value(default)
      end

      instance
    end

    class StringDefaultValue
      def initialize(value)
        @value = value
      end

      def code_fragment
        "'#{@value}'"
      end
    end
  end
end
