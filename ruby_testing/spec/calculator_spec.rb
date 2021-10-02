require './lib/calculator.rb'

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      # removed for brevity
    end
   
    # add this
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "returns the multiplication of two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 7)).to eql(14)
    end

    it "returns the multiplication of multiple numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 7, 2)).to eql(28)
    end
  end
end
