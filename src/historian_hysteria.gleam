import gleam/dict
import gleam/int
import gleam/list
import gleam/option
import gleam/string
import simplifile as file

pub fn part_1() {
  let assert Ok(input) = file.read("./input/day1.txt")

  input
  |> setup()
  |> list_processor()
}

pub fn part_2() {
  let assert Ok(input) = file.read("./input/day1.txt")

  input
  |> setup()
  |> similarity_scores()
}

pub fn list_processor(lists) {
  let #(left, right) = lists

  let left = list.sort(left, by: int.compare)
  let right = list.sort(right, by: int.compare)

  left
  |> list.map2(right, fn(x, y) { int.absolute_value(x - y) })
  |> list.fold(0, int.add)
  |> int.absolute_value
}

pub fn similarity_scores(lists) {
  let #(left, right) = lists
  let new = dict.new()

  let counts = list.fold(right, new, similarity_fold)

  list.fold(left, 0, fn(acc, x) {
    let key = int.to_string(x)

    let sim_score = case dict.get(counts, key) {
      Ok(i) -> x * i
      Error(Nil) -> 0
    }
    acc + sim_score
  })
}

fn increment(key) {
  case key {
    option.Some(i) -> i + 1
    option.None -> 1
  }
}

fn similarity_fold(acc, x) {
  let key = int.to_string(x)
  dict.upsert(acc, key, increment)
}

fn folder(acc, item) {
  let #(left_rest, right_rest) = acc

  let assert [left, right] = string.split(item, "   ")
  let assert Ok(left) = int.parse(left)
  let assert Ok(right) = int.parse(right)

  #([left, ..left_rest], [right, ..right_rest])
}

fn setup(input) {
  input
  |> string.trim()
  |> string.split("\n")
  |> list.fold(#([], []), folder)
}
