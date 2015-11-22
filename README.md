# Initializer

The `initializer` library defines initializers that receive parameters and assign to attributes. It also defines the attributes, allowing the attribute visibility to be declared as well.

NOTE: Dependencies are linked locally in the development environment via the [`path_gem` library](https://github.com/Sans/path-gem). Development dependencies aren't installed by RubyGems.

## Usage

Include initializer and use the initializer macro to define the initializer method and attributes.

```ruby
class SomeItem
  include initializer

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

## TODO

Document the attribute visibility syntax and the default value syntax

## License

Initializer is released under the [MIT License](https://github.com/obsidian-btc/initializer/blob/master/MIT-license.txt).
