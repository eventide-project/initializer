require_relative 'spec_init'

describe "Parameter Visibility" do
  visibility = Initializer::ClassMethods
  attr_name = :some_attr

  specify 'Reader' do
    parameter = visibility.r attr_name

    assert(parameter.reader?)
  end

  specify 'Writer' do
    parameter = visibility.w name

    assert(parameter.writer?)
  end

  specify 'Accessor' do
    parameter = visibility.a name

    assert(parameter.accessor?)
  end

  specify 'No accessor' do
    parameter = visibility.na name

    assert(parameter.no_accessor?)
  end
end
