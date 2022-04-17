# Count mountains and valleys

# From sea level, every 'U' step is toward a mountain and every 'D' step is toward a valley.
# When a person move towards mountain and comes back at sea level, it will be counted as 1 mountain trip. Example: ['U', 'D']
# When a person move towards valley and comes back at sea level, it will be counted as 1 valley trip. Example: ['D', 'U']

def count_mountains_and_valleys(steps)
    ## Defining some variables
    at_sea_level = true # In the beginning the person will be at sea level
    at_mountain = false # Every first 'U' step after sea level will make it true
    at_valley = false # Every first 'D' step after sea level will make it true

    mountain_steps = 0 # On every 'U' step it will be incremented, on every 'D' step it will be decremented. Every time is goes back to zero it will be counted as a mountain
    valley_steps = 0 # On every 'D' step it will be incremented, on every 'U' step it will be decremented. Every time is goes back to zero it will be counted as a valley
    
    mountains = 0 # Number of mountains
    valleys = 0 # Number of valleys
    
    ## Looping through an array of steps
    steps.each do |step|
        if at_sea_level
            step == 'U' ? at_mountain = true : at_valley = true
            at_sea_level = false
        end
        
        if at_mountain
            step == 'U' ? mountain_steps += 1 : mountain_steps -= 1
            if mountain_steps == 0
                at_sea_level = true
                at_mountain = false
                mountains += 1
            end
        elsif at_valley
            step == 'D' ? valley_steps += 1 : valley_steps -= 1
            if valley_steps == 0
                at_sea_level = true
                at_valley = false
                valleys += 1
            end
        end
    end

    puts "Number of Mountains: #{mountains}"
    puts "Number of Valleys: #{valleys}"
end


steps = ['U', 'U', 'U', 'D', 'D', 'D', 'D', 'U', 'D', 'D', 'U', 'U', 'U', 'U', 'D', 'D'] # Input of array of steps
count_mountains_and_valleys(steps) # Call the function