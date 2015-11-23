require_relative 'spec_init'

describe "Initializer Generated with Explicit Visibility" do
  example = Initializer::Controls::Visibility.example

  specify "Default visibility is reader" do
    assert(example.class.reader?(:some_attr))
    assert(example.class.writer?(:some_other_attr))
    assert(example.class.accessor?(:another_attr))
    assert(example.class.no_attr?(:no_attr))
  end

  specify "Attributes values are set by the initializer" do
    assert(example.initialized?(check_no_attr: true))
  end
end
