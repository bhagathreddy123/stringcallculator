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