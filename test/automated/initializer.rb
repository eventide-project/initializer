require_relative 'automated_init'

context "Initializer Generated with Default Attribute Visibility" do
  example = Initializer::Controls::Initialized.example

  test "Default visibility is reader" do
    assert(example.class.reader?(:some_attr))
    assert(example.class.reader?(:some_other_attr))
    assert(example.class.reader?(:another_attr))
  end

  test "Attributes values are set by the initializer" do
    assert(example.initialized?)
  end
end
