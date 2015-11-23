module Initializer
  module Controls
    module Visibility
      class Example
        include Initializer::Controls::Proof

        initializer r(:some_attr), w(:some_other_attr), rw(:another_attr), na(:no_attr)
      end

      def self.example
        Example.new(Attributes.some_attr, Attributes.some_other_attr, Attributes.another_attr, Attributes.no_attr)
      end

      module Override
        class Example
          include Initializer::Controls::Proof

          initializer :some_attr, rw(:some_other_attr), :another_attr, :visibility => :writer
        end

        def self.example
          Example.new(Attributes.some_attr, Attributes.some_other_attr, Attributes.another_attr)
        end
      end
    end
  end
end
