defmodule AdventOfCode.Day4 do
  def runner() do
    input = input_file()
    {part1(input), part2(input)}
  end

  def part1(input) do
    input
    |> parse()
    |> Enum.map(&contains_checker(&1))
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.map(&overlap_checker(&1))
    |> Enum.sum()
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(&mapper(&1))
  end

  defp mapper(item) do
    String.split(item, ",")
    |> Enum.map(&number_range(&1))
    |> List.flatten()
  end

  defp number_range(pair) do
    values = String.split(pair, "-")
    first = values |> Enum.at(0) |> String.to_integer()
    second = values |> Enum.at(1) |> String.to_integer()

    {first, second}
  end

  defp contains_checker([{left_start, left_end}, {right_start, right_end}]) do
    case (left_start <= right_start && left_end >= right_end) ||
         (right_start <= left_start && right_end >= left_end) do
      true -> 1
      _ -> 0
    end
  end

  defp overlap_checker([{left_start, left_end}, {right_start, right_end}]) do
    case (left_start in right_start..right_end) ||
         (left_end in right_start..right_end) ||
         (right_start in left_start..left_end) ||
         (right_end in left_start..left_end) do
      true -> 1
      _ -> 0
    end
  end

  defp input_file() do
    File.read!("input/input4.txt") |> String.trim()
  end
end
