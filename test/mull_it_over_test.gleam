import gleeunit
import gleeunit/should
import mull_it_over

pub fn main() {
  gleeunit.main()
}

pub fn part_1_test() {
  let example =
    "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

  example
  |> mull_it_over.do_string()
  |> should.equal(161)
}
