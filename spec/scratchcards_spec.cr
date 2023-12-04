require "spec"
require "../src/scratchcards.cr"

describe Scratchcards do
  describe "part_1_sample" do
    it "correctly finds the value" do
      gear = Scratchcards.new("input/scratchcards_sample.txt")

      value = gear.part_1

      value.should eq 13
    end
  end

  describe "part_2_sample" do
    it "correctly finds the value" do
      gear = Scratchcards.new("input/scratchcards_sample.txt")

      value = gear.part_2

      value.should eq 30
    end
  end
end
