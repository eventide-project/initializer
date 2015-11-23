module Initializer
  module Controls
    module Proof
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
  end
end
