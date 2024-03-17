def add(str_nums)
  return 0 if str_nums.empty?
  numbers = str_nums.split(",").map(&:to_i)
  numbers.reduce(0,:+)

end

RSpec.describe 'StringCalculator' do
  context "#add" do  
    it "return 0 for empty string" do
     expect(add("")).to eq(0)
    end
    it "return the number itself for a single number" do
    expect(add("1")).to eq(1)
    end
  end
end