defmodule AdventOfCode.Day2 do
  def runner() do
    input = input_file()
    {part1(input), part2(input)}
  end

  def part1(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn item, acc -> states(item) + acc end)
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.map(&mapper(&1))
    |> Enum.reduce(0, fn item, acc -> states(item) + acc end)
  end

  defp mapper(item) do
    values = String.split(item, " ")
    opponent = Enum.at(values, 0)
    condition = Enum.at(values, 1)

    "#{opponent} #{selector(opponent, condition)}"
  end

  defp selector("A", condition) do
    case condition do
      "X" -> "Z"
      "Y" -> "X"
      "Z" -> "Y"
    end
  end

  defp selector("B", condition) do
    case condition do
      "X" -> "X"
      "Y" -> "Y"
      "Z" -> "Z"
    end
  end

  defp selector("C", condition) do
    case condition do
      "X" -> "Y"
      "Y" -> "Z"
      "Z" -> "X"
    end
  end

  defp parse(input) do
    input
    |> String.split("\n")
  end

  defp states(input) do
    scores = %{
      "A X" => 1 + 3,
      "A Y" => 2 + 6,
      "A Z" => 3 + 0,
      "B X" => 1 + 0,
      "B Y" => 2 + 3,
      "B Z" => 3 + 6,
      "C X" => 1 + 6,
      "C Y" => 2 + 0,
      "C Z" => 3 + 3
    }

    scores[input]
  end

  defp input_file() do
    File.read!("input/input2.txt") |> String.trim()
  end
end
