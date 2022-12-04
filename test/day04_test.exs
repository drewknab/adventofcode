defmodule AdventOfCode.Day4Test do
  use ExUnit.Case

  test "test part 1" do
    assert AdventOfCode.Day4.part1(test_input()) == 2
  end

  test "test part 2" do
    assert AdventOfCode.Day4.part2(test_input()) == 4
  end

  defp test_input() do
    "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"
  end
end
