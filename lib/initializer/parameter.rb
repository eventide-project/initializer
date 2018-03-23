module Initializer
  class Parameter
    attr_reader :name
    attr_reader :visibility

    def initialize(name, visibility)
      @name = name
      @visibility = visibility
    end

    def self.build(name, visibility)
      new(name, visibility)
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
