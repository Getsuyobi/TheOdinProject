module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
  
    for k, v in self do
      yield k, v
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    for i in 0..self.length-1 do
      yield(self[i],i)
    end
  end

  def my_select(&block)
    return to_enum(:my_select) unless block_given?

    arr = []
    hash = {}
    
    case self
    when Array
      self.my_each { |item| arr.push(item) if block.call(item) }
      return arr
    when Hash
      self.my_each { |k, v| hash[k] = v if block.call(k, v) }
      hash
    end
  end

  def my_all?(&block)
    return to_enum(:my_all?) unless block_given?

    res = true
    
    self.my_each {|item| res = false unless block.call(item)}
    res

  end

  def my_any?(&block)
    return to_enum(:my_any?) unless block_given?

    res = false
    
    self.my_each {|item| res = true if block.call(item)}
    res

  end

  def my_none?(&block)
    return to_enum(:my_none?) unless block_given?

    res = true
    self.my_each {|item| res = false if block.call(item)}
    res
  end

  def my_map(&block)
    return to_enum(:my_map) unless block_given?

    ary = []
    self.my_each {|item| ary.push(block.call(item))}
    return ary
  end
  
  #TO_DO
  def my_inject(memo=nil)
    
    self.my_each do |item|
      if memo == nil && item == 0

      end
    end
  end

end

puts "my_each"
numbers = [3, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
puts "each"
numbers.each  { |item| puts item }

puts "my_each_with_index"
numbers.my_each_with_index  { |item, i| puts "#{i} : #{item}"}
puts "each_with_index"
numbers.each_with_index  { |item, i| puts "#{i} : #{item}"}

puts "my_select"
puts numbers.my_select {|item| item.even?}

puts "select"
puts numbers.select {|item| item.even?}

puts "my_all?"
puts numbers.my_all? {|item| item>= 3}

puts "all?"
puts numbers.all? {|item| item>= 3}

puts "my_any?"
puts numbers.my_any? {|item| item>= 6}
puts "any?"
puts numbers.any? {|item| item>= 6}

puts "my_none?"
puts numbers.my_none? {|item| item>= 3}

puts "my_map"
puts numbers.my_map
puts numbers.my_map {|item| item*2}

puts "map"
puts numbers.map
puts numbers.map {|item| item*2}

