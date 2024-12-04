import gleam/int
import gleam/io
import gleam/list
import gleam/regexp
import gleam/string
import simplifile as file

pub fn part_1() {
  let assert Ok(input) = file.read("./input/day3.txt")

  input
  |> string.trim()
  |> do_string()
}

pub fn do_string(input) {
  let assert Ok(regex) = regexp.from_string("mul\\([0-9]+,[0-9]+\\)")
  let matches = regexp.scan(regex, input)

  list.map(matches, fn(match) {
    match.content
    |> string.replace("mul(", "")
    |> string.replace(")", "")
    |> string.split(",")
    |> parse_and_multiply()
  })
  |> list.fold(0, int.add)
}

fn parse_and_multiply(item) {
  let assert [x, y] = item

  let assert Ok(x) = int.parse(x)
  let assert Ok(y) = int.parse(y)

  int.multiply(x, y)
}
