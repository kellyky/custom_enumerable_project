require 'pry-byebug'

module Enumerable
  def my_all?
    self.my_each do |el|
      return false unless yield(el)
    end
    true
  end

  def my_any?
    self.my_each do |el|
      return true if yield(el)
    end
    false
  end

  def my_count
    return self.length unless block_given?
    counter = 0
    self.my_each do |el|
      counter += 1 if yield(el)
    end
    counter
  end

  def my_each_with_index
    (self.length).times do |i|
      yield(self[i], i)
    end
    self
  end

  def my_inject(acc)
    self.my_each do |el|
      acc = yield(acc, el)
    end
    acc
  end

  def my_map
    arr = []
    self.each do |el|
      arr << yield(el)
    end
    arr
  end

  def my_none?
    self.my_each do |el|
      return false if yield(el)
    end
    true
  end

  def my_select
    arr = []
    self.each do |el|
      arr << el if yield(el)
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    (self.length).times do |i|
      yield(self[i])
    end
    self
  end
end

