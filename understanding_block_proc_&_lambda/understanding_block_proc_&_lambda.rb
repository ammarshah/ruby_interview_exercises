                                            # Understanding Block vs Proc vs Lambda




        # 1 - Block can't be assigned to a variable but Proc and Lambda can

# Block
a = {|str| puts str} # => syntax error, unexpected local variable or method, expecting `do' or '{' or '('

# Proc
a = proc {|str| puts str} # => Returns a Proc object

# Lambda
a = lambda {|str| puts str} # => Returns a Proc object of type (lambda)
# or
a = -> (str) {puts str} # => Returns a Proc object of type (lambda)




        # 2 - There are two ways to define a method that accepts a block

# One is to require a block as an argument and then call it
def calculate_with_block(num1, num2, &block)
    block.call(num1, num2)
end

# Calling method with block
calculate_with_block(1, 2) { |num1, num2| num1 + num2 }
# OR
calculate_with_block(1, 2) do |num1, num2|
    num1 + num2
end


# Second is to not require a block as an argument and then put a `yield` where you want to call the block
def calculate_with_yield(num1, num2)
    yield(num1, num2) # `yield` can be used multiple times here
end

# Calling the method with block
calculate_with_yield(1, 2) { |num1, num2| num1 + num2 }
# OR
calculate_with_yield(1, 2) do |num1, num2|
    num1 + num2
end




        # 3 - Proc doesn't care about the number of arguments but Lambda does

a = proc {|str| puts str}
a.call('Hello') # => Hello
a.call('Hello', 'World') # => Hello

a = lambda {|str| puts str}
a.call('Hello') # => Hello
a.call('Hello', 'World') # => ArgumentError (wrong number of arguments (given 2, expected 1))




        # 4 - Return keyword in a Proc definition will also return from its caller method

# Assigning a Proc with return keyword to a variable
sum = proc do |num1, num2|
    return num1 + num2
end

# Passing a Proc as an argument
def calculate(num1, num2, operation)
    puts operation.call(num1, num2)
    puts "This will not execute"
end

calculate(2, 3, sum) # => LocalJumpError (unexpected return)


# Using Proc inside a method with return keyword
def calculate(num1, num2)
    # Assigning a Proc with return keyword to a variable
    sum = proc do |num1, num2|
        return num1 + num2
    end
    puts sum.call(num1, num2)
    puts "This will not execute"
end

calculate(2, 3) # => 5




        # 5 - Return keyword in a Lambda definition will only return from where it was defined

# Assigning a Lambda with return keyword to a variable
sum = lambda do |num1, num2|
    return num1 + num2
end

# Passing a Lambda as an argument
def calculate(num1, num2, operation)
    puts operation.call(num1, num2)
    puts "This will execute"
end

calculate(2, 3, sum) # => 5
                     # => This will execute


# Using Lambda inside a method with return keyword
def calculate(num1, num2)
    # Assigning a Lambda with return keyword to a variable
    sum = lambda do |num1, num2|
        return num1 + num2
    end
    puts sum.call(num1, num2)
    puts "This will execute"
end

calculate(2, 3) # => 5
                # => This will execute




        # 6 - Closure: `proc` & `lambda` will carry with it values like local variables and methods from the context where it was defined

def call_proc(my_proc)
    count = 500
    my_proc.call
end

count = 1
my_proc = proc { puts count }
puts call_proc(my_proc) # => 1
