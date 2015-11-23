require_relative 'spec_init'

describe 'Reader Attribute' do
  attr_name = :some_attribute
  target_class = Initializer::Controls::TargetClass.example

  specify 'Adds a reader to the target class' do
    visibility = :reader

    attribute = Initializer::Attribute.define(target_class, attr_name, visibility)

    assert(target_class.reader?(attr_name))
  end
end
