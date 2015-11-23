module Initializer
  module Controls
    module DefaultValues
      class Example
        include Initializer::Controls::Proof

        initializer r(:some_attr, Attributes.some_attr),
          w(:some_other_attr, Attributes.some_other_attr),
          rw(:another_attr, Attributes.another_attr),
          na(:no_attr, Attributes.no_attr),
          rw(:lazy_attr, lazy('1 + 1')),
          r(:symbol_attr, :some_symbol)
      end

      def self.example
        Example.new
      end
    end
  end
end
