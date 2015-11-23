module Initializer
  class Statement
    attr_reader :code_fragment

    def initialize(code_fragment)
      @code_fragment = code_fragment
    end
  end
end
