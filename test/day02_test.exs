defmodule AdventOfCode.Day2Test do
  use ExUnit.Case

  test "test part 1" do
    assert AdventOfCode.Day2.part1(test_input()) == 15
  end

  test "test part 2" do
    assert AdventOfCode.Day2.part2(test_input()) == 12
  end

  defp test_input() do
    "A Y
B X
C Z"
  end
end
