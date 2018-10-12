require_relative '../automated_init'

context "Activation" do
  context "Include" do
    test "Initializer macro is defined on class" do
      assert(Controls::Included::Example.respond_to?(:initializer))
    end
  end
end
