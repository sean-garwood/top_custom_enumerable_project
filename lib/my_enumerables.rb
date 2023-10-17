module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # pass each item in array as a block argument
  # need to:
    # i = 0
    # initialize an empty array that will be filled with elements and returned
    # arr = []
    # check if Array[counter].nil?
      # if not, Array << element
      # if so, break out completely, return array
        # this would be a proc since we want to return the last element once
        # it's reached.
  def my_each
    arr = []
    for i in 0..self.length-1
      result = yield(self[i])
      result.nil? ? arr << self[i] : arr << result
    end
    return arr
  end
end

some_array = Array.new([1, 2, 3])
result = some_array.my_each { |e| }
p result
