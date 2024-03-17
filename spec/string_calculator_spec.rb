def add(str_nums)
  return 0 if str_nums.empty?
end

RSpec.describe 'StringCalculator' do
  context "#add" do  
    it "return 0 for empty string" do
     expect(add("")).to eq(0)
    end
  end
end