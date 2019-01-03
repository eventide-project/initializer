# Initializer

The `initializer` library defines initializers that receive parameters and assign to attributes. It also defines the attributes, allowing the attribute visibility to be declared as well.

## Usage

Use the initializer macro to define the initializer method and attributes:

```ruby
class SomeItem
  initializer :name, :age, :address
end
```

The above usage is equivalent to:

```ruby
class SomeItem
  attr_reader :name, :age, :address, :phone_number

  def initialize(name, age, address, phone_number)
    @name = name
    @age = age
    @address = address
    @phone_number = phone_number
  end
end
```

### Visibility

```ruby
class SomeItem
  initializer r(:name), w(:age), rw(:address), na(:phone_number)
end
```

The above usage is equivalent to:

```ruby
class SomeItem
  attr_reader :name
  attr_writer :age
  attr_accessor :address

  def initialize(name, age, address, phone_number)
    @name = name
    @age = age
    @address = address
    @phone_number = phone_number
  end
end
```

| Visibility | Effect | Equivalent |
| --- | --- | --- |
| r | Read Only | attr_reader |
| w | Write Only | attr_writer |
| rw | Read/Write | attr_accessor |
| na | No Accessor | (none) |

Note: The `rw` visibility can also be aliased as `a`.

#### Default Visibility

An attribute that is not declared with an explicit visibility is given the `r` (read only) visibility by default.

```ruby
class SomeItem
  initializer :name
end
```

The above example is equivalent to:

```ruby
class SomeItem
  initializer r(:name)
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
  include Initializer

  initializer :name, :age, :address
end
```

## License

Initializer is released under the [MIT License](https://github.com/obsidian-btc/initializer/blob/master/MIT-License.txt).
