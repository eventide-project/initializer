require_relative 'automated_init'

context "Initializer Generated with Overridden Default Visibility" do
  example = Initializer::Controls::Visibility::Override.example

  test "Default visibility is writer" do
    assert(example.class.writer?(:some_attr))
    assert(example.class.writer?(:another_attr))
  end

  test "Specified visibility is not overridden" do
    assert(example.class.accessor?(:some_other_attr))
  end

  test "Attributes values are set by the initializer" do
    assert(example.initialized?)
  end
end
