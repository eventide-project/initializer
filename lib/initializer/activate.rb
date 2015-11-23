module Initializer
  def self.activate(target_class=nil)
    target_class ||= Object

    macro_module = Initializer::Macro

    return if target_class.is_a? macro_module

    target_class.extend(macro_module)
  end
end
