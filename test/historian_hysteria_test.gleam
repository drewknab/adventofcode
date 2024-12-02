import gleeunit
import gleeunit/should
import historian_hysteria

pub fn main() {
  gleeunit.main()
}

pub fn part_1_test() {
  let left = [3, 4, 2, 1, 3, 3]
  let right = [4, 3, 5, 3, 9, 3]

  historian_hysteria.list_processor(#(left, right))
  |> should.equal(11)
}

pub fn part_2_test() {
  let left = [3, 4, 2, 1, 3, 3]
  let right = [4, 3, 5, 3, 9, 3]

  historian_hysteria.similarity_scores(#(left, right))
  |> should.equal(31)
}
