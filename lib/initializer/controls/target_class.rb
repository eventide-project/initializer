module Initializer
  module Controls
    module TargetClass
      def self.example
        Class.new do
          extend Initializer::Controls::Proof
        end
      end
    end
  end
end
