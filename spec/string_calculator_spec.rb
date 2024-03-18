class StringCalculator
  def self.add(str_nums)
    return 0 if str_nums.empty?
    numbers = str_nums.split(",").map(&:to_i)
    numbers.reduce(0,:+)
  end
end

RSpec.describe 'StringCalculator' do
  context "#add" do  
    it "return 0 for empty string" do
     expect(StringCalculator.add("")).to eq(0)
    end

    it "return the number itself for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of numbers for comma separated numbers" do
      expect(StringCalculator.add("1,4")).to eq(5)
    end

  end
end