defmodule AdventOfCode.Day1 do
  def runner() do
    input = input_file()
    {part1(input), part2(input)}
  end

  def part1(input) do
    input
    |> parse()
    |> Enum.map(fn item -> Enum.sum(item) end)
    |> Enum.max()
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.map(fn item -> Enum.sum(item) end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp parse(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(&mapper(&1))
  end

  defp mapper(item) do
    item
    |> String.split("\n")
    |> Enum.map(fn item -> String.to_integer(item) end)
  end

  defp input_file() do
    File.read!("input/input1.txt") |> String.trim()
  end
end
