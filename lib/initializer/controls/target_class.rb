module Initializer
  module Controls
    module TargetClass
      class Example
        extend Initializer::Controls::Proof
      end

      def self.example
        Example
      end
    end
  end
end
