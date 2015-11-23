require_relative 'spec_init'

describe 'Attribute' do
  let(:attr_name) { :some_attribute }
  let(:target_class) { Initializer::Controls::TargetClass.example }

  specify 'Reader' do
    visibility = :reader

    attribute = Initializer::Attribute.define(target_class, attr_name, visibility)

    assert(target_class.reader?(attr_name))
  end

  specify 'Writer' do
    visibility = :writer

    attribute = Initializer::Attribute.define(target_class, attr_name, visibility)

    assert(target_class.writer?(attr_name))
  end
end
