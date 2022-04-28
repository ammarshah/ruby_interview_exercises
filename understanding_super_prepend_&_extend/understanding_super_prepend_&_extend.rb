module MyModule
    def printer(msg)
        puts "MyModule says that your message is: #{msg}"
        super
    end
end

# Class with `prepend`
class MyClass
    prepend MyModule
    def printer(msg)
        puts "MyClass says that your message is: #{msg}"
    end
end

first_instance = MyClass.new
first_instance.printer("Hello World from First Instance!")
# Since we have the `printer` instance method defined in both MyModule and MyClass
# and because we are prepending MyModule in MyClass
# so when we call the `printer` method on MyClass' instance
# it will only call the `printer` method defined in MyModule
# and then it will call `printer` method defined in MyClass
# only because of the `super` call in the `printer` method of MyModule.
# If we remove the `super` call, then it will not run `printer` method of MyClass.



# Same class without `prepend`
class MySecondClass
    def printer(msg)
        puts "MySecondClass says that your message is: #{msg}"
    end
end

second_instance = MySecondClass.new
second_instance.extend MyModule
second_instance.printer("Hello World from Second Instance!")
# `extend` does the same thing as `prepend`
# but it only attaches the extended module's functionality
# to the instance on which we called `extend`


third_instance = MySecondClass.new
third_instance.printer("Hello World from Third Instance!")
# It didn't call the module's `printer` method