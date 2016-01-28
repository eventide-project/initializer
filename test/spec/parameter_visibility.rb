require_relative 'spec_init'

context "Parameter Visibility" do
  visibility = Initializer::Visibility
  attr_name = :some_attr

  test 'Reader' do
    parameter = visibility.r attr_name

    assert(parameter.reader?)
  end

  test 'Writer' do
    parameter = visibility.w attr_name

    assert(parameter.writer?)
  end

  test 'Accessor' do
    parameter = visibility.a attr_name

    assert(parameter.accessor?)
  end

  test 'No accessor' do
    parameter = visibility.na attr_name

    assert(parameter.no_accessor?)
  end
end
