# 0,1,1,2,3,5,8,13,21,34,55,89...

def fibonacci(n)
    return 1 if n < 2
    return fibonacci(n - 1) + fibonacci(n - 2)
end

puts fibonacci(6)