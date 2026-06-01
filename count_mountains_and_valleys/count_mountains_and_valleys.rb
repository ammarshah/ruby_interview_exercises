# Given an array of steps, count the number of mountains and valleys.

=begin
  Problem:
    From sea level, every 'U' step is towards a mountain, and every 'D' step is towards a valley.
    When a person moves towards a mountain and comes back to sea level, it will be counted as 1 mountain trip, for example, ['U', 'D'].
    When a person moves towards a valley and comes back to sea level, it will be counted as 1 valley trip, for example, ['D', 'U'].
    The function should return a hash with the total count of mountains and valleys.

  Example:
    Input: ['U', 'U', 'U', 'D', 'D', 'D', 'D', 'U', 'D', 'D', 'U', 'U', 'U', 'U', 'D', 'D']
    Output: { mountains: 2, valleys: 2 }

  Explanation:
    - The first three 'U' steps take the person to the top of a mountain, and the next three 'D' steps bring them back to sea level, counting as 1 mountain.
    - The next 'D' step takes the person down into a valley, and the following 'U' step brings them back to sea level, counting as 1 valley.
    - The next two 'D' steps take the person down into another valley, and the next two 'U' steps bring them back to sea level, counting as another valley.
    - The next two 'U' steps take the person to the top of a mountain, and the next two 'D' steps bring them back to sea level, counting as another mountain.
=end

def count_mountains_and_valleys(steps)
  step_counter = 0
  result = { mountains: 0, valleys: 0 }

  steps.each do |current_step|
    if current_step == 'U'
      step_counter += 1
      result[:valleys] += 1 if step_counter == 0
    else
      step_counter -= 1
      result[:mountains] += 1 if step_counter == 0
    end
  end

  result
end
