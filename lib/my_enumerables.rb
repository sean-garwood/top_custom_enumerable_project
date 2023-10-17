module Enumerable
  # Your code goes here
end

class Array
  def my_each
    for i in 0..self.length-1
      yield(self[i])
    end
    self
  end
end
