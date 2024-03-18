class StringCalculator
  def self.add(str_nums)
    return 0 if str_nums.empty?
    delimiter = extract_delimiter(str_nums)
    numbers = extract_numbers(str_nums, delimiter)
    check_negatives(numbers)
    numbers.reduce(0,:+)
  end

  def self.extract_delimiter(str_nums)
    delimiter = ","
    if str_nums.start_with?("//")
      delimiter = str_nums[2]
      str_nums = str_nums.split("\n", 2)[1]
    end
    delimiter
  end

  def self.extract_numbers(str_nums, delimiter)
    str_nums.gsub!(/\n/, delimiter)
    str_nums.split(delimiter).map(&:to_i)
  end

  def self.check_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
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

    it "returns the sum of the numbers for numbers separated by new lines" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add("1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed -2")
    end

    it 'raises an exception for multiple negative numbers' do
      expect { StringCalculator.add("1,-2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed -2,-3")
    end

  end
end