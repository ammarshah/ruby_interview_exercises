# Number To Words
Provides an `in_words` class method that you can use to convert upto Duotrigintillion (10^99) number in words.

## Usage

### How to include

Copy lib/number_in_words.rb file to, for example, lib/ directory of your ruby/rails project & then require it in any class using:

```ruby
require_relative "lib/number_in_words" # In non-rails project
# require "#{Rails.root}/lib/number_in_words" # In Rails project, when lib folder is not autoloaded

class Order
    attr_accessor :amount

    def amount_in_words(titleize: false, add_and: false)
        NumberInWords.in_words(amount, titleize: titleize, add_and: add_and)
    end
end
```

(Note: attribute `amount` here has an Integer type)

### How to use

`in_words` method of the `NumberInWords` module above takes two optional boolean parameters, `titleize` and `add_and`. By default they both are `false`.

```ruby
order1 = Order.new
order1.amount = 123
puts order1.amount_in_words # => "one hundred twenty-three"

order2 = Order.new
order2.amount = 5005
puts order2.amount_in_words(titleize: true) # => Five Thousand Five

order3 = Order.new
order3.amount = 211
puts order3.amount_in_words(add_and: true) # => two hundred and eleven

expensive_order = Order.new
expensive_order.amount = 205810003
puts expensive_order.amount_in_words(titleize: true, add_and: true) # => Two Hundred Five Million Eight Hundred Ten Thousand and Three
```

## Run the tests

Simply use `rspec` command to run all the tests while you're in /as_a_module directory.