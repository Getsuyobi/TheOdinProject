class Calculator
  def add(a,*b)
    b.each do |num|
      a = a+num
    end
    a
  end

  def multiply(a,*b)
    b.each do |num|
      a = a*num
    end
    a
  end
end
