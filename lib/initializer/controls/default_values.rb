module Initializer
  module Controls
    module DefaultValues
      class Example
        include Initializer::Controls::Proof

        initializer r(:some_attr, Attributes.some_attr), w(:some_other_attr, Attributes.some_other_attr), rw(:another_attr, Attributes.another_attr), na(:no_attr, Attributes.no_attr, rw(:lazy_attr, lazy('DateTime.now')), r(:symbol_attr, :symbol_value))
      end

      def self.example
        Example.new
      end
    end
  end
end
