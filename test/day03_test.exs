defmodule AdventOfCode.Day3Test do
  use ExUnit.Case

  test "test part 1" do
    assert AdventOfCode.Day3.part1(test_input()) == 157
  end

  test "test part 1 compartments" do
    parsed = AdventOfCode.Day3.compartments(test_input())

    assert parsed == test_compartments()
  end

  test "test part 1 matching items" do
    shared =
      test_input()
      |> AdventOfCode.Day3.compartments()
      |> Enum.map(&(AdventOfCode.Day3.find_match(&1)))

    assert shared == test_shared()
  end

  test "test part 1 priority" do
    priorities =
      test_input()
      |> AdventOfCode.Day3.compartments()
      |> Enum.map(&(AdventOfCode.Day3.find_match(&1)))
      |> AdventOfCode.Day3.find_priorities(AdventOfCode.Day3.priority())

    assert priorities == test_priorities()
  end

  test "test part 2" do
    assert AdventOfCode.Day3.part2(test_input()) == 70
  end

  test "test part 2 groups" do
    groups =
      test_input()
      |> AdventOfCode.Day3.groups()

    assert groups == test_groups()
  end

  test "test part 2 badge match" do
    badges =
      test_input()
      |> AdventOfCode.Day3.groups()
      |> Enum.map(&AdventOfCode.Day3.badge_match(&1))

    assert badges == [["r"], ["Z"]]
  end

  test "test part 2 priority match" do
    priorities =
      test_input()
      |> AdventOfCode.Day3.groups()
      |> Enum.map(&AdventOfCode.Day3.badge_match(&1))
      |> AdventOfCode.Day3.find_priorities(AdventOfCode.Day3.priority())

    assert priorities == [18, 52]
  end

  defp test_priorities() do
    [16, 38, 42, 22, 20, 19]
  end

  defp test_shared() do
    [["p"], ["L"], ["P"], ["v"], ["t"], ["s"]]
  end

  defp test_compartments() do
    [
      {"vJrwpWtwJgWr", "hcsFMMfFFhFp"},
      {"jqHRNqRjqzjGDLGL", "rsFMfFZSrLrFZsSL"},
      {"PmmdzqPrV", "vPwwTWBwg"},
      {"wMqvLMZHhHMvwLH", "jbvcjnnSBnvTQFn"},
      {"ttgJtRGJ", "QctTZtZT"},
      {"CrZsJsPPZsGz", "wwsLwLmpwMDw"}
    ]
  end

  defp test_groups() do
    [
      ["vJrwpWtwJgWrhcsFMMfFFhFp","jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL","PmmdzqPrVvPwwTWBwg"],
      ["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]
    ]
  end

  defp test_input() do
    "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"
  end
end
