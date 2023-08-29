# 0,1,1,2,3,5,8,13,21,34,55,89...

def fibonacci(n)
  (0..n-1).each_with_object([]) { |num, arr| num < 2 ? arr << num : arr << arr.last(2).sum }
end

p fibonacci(8) # => [0,1,1,2,3,5,8,13]