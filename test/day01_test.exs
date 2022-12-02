defmodule AdventOfCode.Day1Test do
  use ExUnit.Case

  test "test part 1" do
    assert AdventOfCode.Day1.part1(test_input()) == 24000
  end

  test "test part 2" do
    assert AdventOfCode.Day1.part2(test_input()) == 45000
  end

  defp test_input() do
    "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"
  end
end
