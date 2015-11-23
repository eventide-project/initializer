require_relative 'spec_init'

describe "Initializer Generated with Default Values" do
  example = Initializer::Controls::DefaultValues.example

  specify "Attributes values are set by the initializer" do
    assert(example.initialized?(check_no_attr: true))
  end
end
