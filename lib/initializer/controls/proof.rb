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

        def no_attr?(attr_name)
          !accessor?(attr_name)
        end

        def reads?(attr_name)
          method_defined? attr_name
        end

        def writes?(attr_name)
          method_defined? :"#{attr_name}="
        end
      end

      def initialized?(check_no_attr: nil)
        check_no_attr ||= false

        attrs_equal = @some_attr == Attributes.some_attr &&
          @some_other_attr == Attributes.some_other_attr &&
          @another_attr == Attributes.another_attr

        unless check_no_attr
          return attrs_equal
        else
          return attrs_equal && (@no_attr == Attributes.no_attr)
        end
      end
    end
  end
end
