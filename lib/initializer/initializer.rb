module Initializer
  NO_DEFAULT_VALUE = Object.new

  def self.included(base)
    base.extend ClassMethods
  end

  module Macro
    extend self

    def self.extended(obj)
      obj.extend Visibility
    end

    def initializer_macro(*parameters)
      Generator.generate_definitions self, parameters
    end
    alias :initializer :initializer_macro
  end
end
