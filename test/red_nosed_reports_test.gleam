import gleam/list
import gleeunit
import gleeunit/should
import red_nosed_reports

pub fn main() {
  gleeunit.main()
}

pub fn part_1_test() {
  let example = [
    [7, 6, 4, 2, 1],
    [1, 2, 7, 8, 9],
    [9, 7, 6, 2, 1],
    [1, 3, 2, 4, 5],
    [8, 6, 4, 4, 1],
    [1, 3, 6, 7, 9],
  ]

  example
  |> list.count(red_nosed_reports.safe)
  |> should.equal(2)
}

pub fn part_2_test() {
  let example = [
    [7, 6, 4, 2, 1],
    [1, 2, 7, 8, 9],
    [9, 7, 6, 2, 1],
    [1, 3, 2, 4, 5],
    [8, 6, 4, 4, 1],
    [1, 3, 6, 7, 9],
  ]

  example
  |> list.count(red_nosed_reports.dampen_safe)
  |> should.equal(4)
}
