# frozen_string_literal: true

# custom enumberable methods, included in Array class
module Enumerable
  def my_each_with_index
    i = 0
    my_each { |e| yield(e, i) }; i+=1
    self
  end

  def my_count(&condition)
    !block_given? && length || my_select do |e|
      condition.call(e).length
    end
  end

  def my_inject(accumulator, &block)
    my_each do |e|
      block.call(accumulator, e) => accumulator
    end
    accumulator
  end

  def my_map
    mapped = []
    my_each { |e| mapped << yield(e) }
    mapped
  end

  def my_select(&condition)
    selected = []
    my_each { |e| selected << e if condition.call(e) }
    selected
  end

  def my_all?(&condition)
    self == my_select { |e| condition.call(e) }
  end

  def my_any?(&condition)
    !my_select { |e| condition.call(e) }.empty?
  end

  def my_none?(&condition)
    !my_any? { |e| condition.call(e) }
  end
end

# Rebuild the Array#each method, use it as basis for fns in module Enumberable
class Array
include Enumerable
  def my_each
    for e in self
      yield e
    end
    self
  end
end
