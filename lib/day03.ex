defmodule AdventOfCode.Day3 do
  def runner() do
    input = input_file()
    {part1(input), part2(input)}
  end

  def part1(input) do
    input
    |> compartments()
    |> Enum.map(&find_match(&1))
    |> find_priorities(priority())
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> groups()
    |> Enum.map(&badge_match(&1))
    |> find_priorities(priority())
    |> Enum.sum()
  end

  def compartments(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn item -> String.split_at(item, trunc(String.length(item) / 2)) end)
  end

  def groups(input) do
    input
    |> String.split("\n")
    |> Enum.chunk_every(3)
  end

  def badge_match([first, second, third]) do
    matches = find_match({first, second})

    find_match({Enum.join(matches, ""), third})
  end

  def find_match({first, second}) do
    first
    |> String.split("")
    |> Enum.filter(fn item -> filter(item, second) end)
    |> Enum.uniq()
  end

  def find_priorities(values, priorities) do
    values
    |> Enum.map(fn item -> Enum.at(item, 0) end)
    |> Enum.map(fn item -> priorities[item] end)
  end

  def priority() do
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    |> String.split("")
    |> Enum.with_index()
    |> Map.new()
  end

  defp filter(item, second) do
    case item do
      "" -> :false
      letter -> String.contains?(second, letter)
    end
  end

  defp input_file() do
    File.read!("input/input3.txt") |> String.trim()
  end
end
