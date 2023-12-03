require "spec"
require "../src/trebuchet.cr"

describe Trebuchet do
  describe "part_1_sample" do
    it "correctly finds the sum of the parsed numbers for sample1" do
      trebuchet = Trebuchet.new("input/trebuchet_sample1.txt")
      value = trebuchet.part_1
      
      value.should eq 142
    end
  end

  describe "part_2_sample" do
    it "correctly finds the sum of the parsed numbers for sample2" do
      trebuchet = Trebuchet.new("input/trebuchet_sample2.txt")
      value = trebuchet.part_2
      
      value.should eq 281
    end
  end

  describe "part_1" do
    it "correctly finds the sum of the parsed numbers for sample1" do
      trebuchet = Trebuchet.new
      value = trebuchet.part_1
      
      value.should eq 55386
    end
  end

  describe "part_2" do
    it "correctly finds the sum of the parsed numbers for sample2" do
      trebuchet = Trebuchet.new
      value = trebuchet.part_2
      
      value.should eq 54824
    end
  end
end
