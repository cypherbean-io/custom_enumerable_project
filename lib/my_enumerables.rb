module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    count = 0
    my_each do |element|
      yield element, count
      count += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    my_each { |element| result << element if yield element }
    result
  end

  def my_all?
    if block_given?
      my_each { |element| return false unless yield element }
    else
      my_each { |element| return false unless element }
    end
    true
  end

  def my_any?
    if block_given?
      my_each { |element| return true if yield element }
    else
      my_each { |element| return true if element }
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |element| return false if yield element }
    else
      my_each { |element| return false if element }
    end
    true
  end

  def my_count(*arg)
    count = 0
    if block_given?
      my_each { |element| count += 1 if yield element }
    elsif arg.empty?
      count = size
    # else
    #   my_each { |element| count += 1 if element == arg[0] }
    end
    count
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    count = 0
    while count < size
      yield self[count]
      count += 1
    end
    self
  end
end
