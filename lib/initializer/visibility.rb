module Initializer
  module Visibility
    extend self

    def r(parameter_name, default=NO_DEFAULT_VALUE)
      return Parameter.build(parameter_name, :reader, default)
    end

    def w(parameter_name, default=NO_DEFAULT_VALUE)
      return Parameter.build(parameter_name, :writer, default)
    end

    def a(parameter_name, default=NO_DEFAULT_VALUE)
      return Parameter.build(parameter_name, :accessor, default)
    end
    alias :rw :a

    def na(parameter_name, default=NO_DEFAULT_VALUE)
      return Parameter.build(parameter_name, :no_accessor, default)
    end

    def lazy(statement)
      Statement.new(statement)
    end
  end
end
