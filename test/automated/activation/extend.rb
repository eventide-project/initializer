require_relative '../automated_init'

context "Activation" do
  context "Extend" do
    test "Initializer macro is defined on class" do
      assert(Controls::Included::Example.is_a?(Initializer::Macro))
    end
  end
end
