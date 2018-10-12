require_relative '../automated_init'

context "Activation" do
  context "Activate" do
    Initializer.activate(Controls::Clean::Example)

    test "Initializer macro is defined on class" do
      assert(Controls::Clean::Example.is_a?(Initializer::Macro))
    end
  end
end
