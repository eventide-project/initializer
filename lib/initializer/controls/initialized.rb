module Initializer
  module Controls
    module Initialized
      class Example
        Initializer.activate(self)

        include Initializer::Controls::Proof

        initializer :some_attr, :some_other_attr, :another_attr
      end

      def self.example
        Example.new(Attributes.some_attr, Attributes.some_other_attr, Attributes.another_attr)
      end
    end
  end
end
