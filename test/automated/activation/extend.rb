require_relative '../automated_init'

context "Activation" do
  context "Extend" do
    test "Initializer macro is defined on class" do
      assert(Controls::Extended::Example.respond_to?(:initializer))
    end
  end
end
