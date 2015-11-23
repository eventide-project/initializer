# Initializer

The `initializer` library defines initializers that receive parameters and assign to attributes. It also defines the attributes, allowing the attribute visibility to be declared as well.

## Usage

Use the initializer macro to define the initializer method and attributes:

```ruby
class SomeItem
  initializer :name, :age, :address
end
```

The above usage would be the equivalent of:

```ruby
class SomeItem
  attr_accessor :name, :age, :address

  def initialize(name, age, address)
    @name = name
    @age = age
    @address = address
  end
end
```

## Setup

Require initializer library and activate the macro in you're project's boot up code (e.g.: an initializer in a rails app, or some init file in a library, etc):

```ruby
require 'initializer'
Initializer.activate
```

It's not strictly necessary to activate the macro "globally". Include initializer specifically in the class that you want to use it in:

```ruby
class SomeItem
  include initializer

  initializer :name, :age, :address
end
```

## TODO

Document the attribute visibility syntax and the default value syntax

## License

Initializer is released under the [MIT License](https://github.com/obsidian-btc/initializer/blob/master/MIT-License.txt).
