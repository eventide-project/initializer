module Initializer
  module Visibility
    extend self

    def r(parameter_name)
      return Parameter.build(parameter_name, :reader)
    end

    def w(parameter_name)
      return Parameter.build(parameter_name, :writer)
    end

    def a(parameter_name)
      return Parameter.build(parameter_name, :accessor)
    end
    alias :rw :a

    def na(parameter_name)
      return Parameter.build(parameter_name, :no_accessor)
    end

    def lazy(statement)
      Parameter::Statement.new(statement)
    end
  end
end
