require "spec"
require "../src/cube_conundrum.cr"

describe CubeConundrum do
  describe "part_1_sample" do
    it "correctly finds the value" do
      cube = CubeConundrum.new("input/cube_conundrum_sample.txt")

      value = cube.part_1

      value.should eq 8
    end
  end

  describe "part_2_sample" do
    it "correctly finds the value" do
      cube = CubeConundrum.new("input/cube_conundrum_sample.txt")

      value = cube.part_2

      value.should eq 2286
    end
  end

  describe "part_1" do
    it "correctly finds the value" do
      cube = CubeConundrum.new()

      value = cube.part_1

      value.should eq 2406
    end
  end

  describe "part_2" do
    it "correctly finds the value" do
      cube = CubeConundrum.new()

      value = cube.part_2

      value.should eq 78375
    end
  end
end
