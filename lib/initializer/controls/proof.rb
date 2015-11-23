module Initializer
  module Controls
    module Proof
      def self.included(cls)
        cls.extend ClassProof
      end

      module ClassProof
        def reader?(attr_name)
          reads?(attr_name) && !writes?(attr_name)
        end

        def writer?(attr_name)
           writes?(attr_name) && !reads?(attr_name)
        end

        def accessor?(attr_name)
          reads?(attr_name) && writes?(attr_name)
        end

        def reads?(attr_name)
          method_defined? attr_name
        end

        def writes?(attr_name)
          method_defined? :"#{attr_name}="
        end
      end

      def initialized?
        some_attr == Attributes.some_attr &&
          some_other_attr == Attributes.some_other_attr &&
          another_attr == Attributes.another_attr
      end
    end
  end
end
