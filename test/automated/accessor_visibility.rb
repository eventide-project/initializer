require_relative 'automated_init'

context "Initializer Generated with Explictest Visibility" do
  example = Initializer::Controls::Visibility.example

  test "Default visibility is reader" do
    assert(example.class.reader?(:some_attr))
    assert(example.class.writer?(:some_other_attr))
    assert(example.class.accessor?(:another_attr))
    assert(example.class.no_attr?(:no_attr))
  end

  test "Attributes values are set by the initializer" do
    assert(example.initialized?(check_no_attr: true))
  end
end
