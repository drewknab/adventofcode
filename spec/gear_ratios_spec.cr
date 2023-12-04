require "spec"
require "../src/gear_ratios.cr"

describe GearRatios do
  describe "part_1_sample" do
    it "correctly finds the value" do
      gear = GearRatios.new("input/gear_ratios_sample.txt")

      value = gear.part_1

      value.should eq 4361
    end
  end

  describe "part_2_sample" do
    it "correctly finds the value" do
      gear = GearRatios.new("input/gear_ratios_sample.txt")

      value = gear.part_2

      value.should eq 467835
    end
  end
end
