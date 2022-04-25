                                                # Basic Destructuring

# Example # 1
def sum((num1, num2))
    num1 + num2
end

puts sum([2, 4]) # => 6
puts sum([2, 4, 1]) # Also returns 6 because only first two numbers are going to be assigned when it will be destructured


# Example # 2
def sum_and_multiply((num1, num2), multiplier)
    (num1 + num2) * multiplier
end

puts sum_and_multiply([2, 4], 2) # => 12
puts sum_and_multiply([2, 4, 1], 3) # => 18



                                                # Destructure 2D array and iterate over it
students = [
    ['Ammar', 30],
    ['Sundus', 31],
    ['Fawad', 32]
]

students.each do |(name, age)|
    puts "#{name} is #{age} years old"
end