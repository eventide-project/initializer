module Initializer
  def self.included(base)
    base.extend Macro
  end

  module Macro
    extend self

    def self.extended(obj)
      obj.extend Visibility
    end

    def initializer_macro(*parameters)
      Generator.(self, parameters)
    end
    alias :initializer :initializer_macro
  end
end
