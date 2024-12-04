import gleam/int
import gleam/list
import gleam/string
import simplifile as file

pub fn part_1() {
  let assert Ok(input) = file.read("./input/day2.txt")

  input
  |> setup()
  |> list.count(safe)
}

pub fn part_2() {
  let assert Ok(input) = file.read("./input/day2.txt")

  input
  |> setup()
  |> list.count(dampen_safe)
}

pub fn dampen_safe(report) {
  safe(report) || dampened(report, [])
}

pub fn safe(report) {
  case report {
    [l1, l2, ..] if l1 == l2 -> False
    [l1, l2, ..] -> {
      let sign = sign(l1 - l2)
      safe_and_sign(report, sign)
    }
    [_] -> True
    [] -> False
  }
}

fn safe_and_sign(report, prev_sign: Int) {
  case report {
    [_] -> True
    _ -> {
      let assert [l1, l2, ..rest] = report

      let sum = int.absolute_value(l1 - l2)

      case sum <= 3 && sign(l1 - l2) == prev_sign {
        True -> safe_and_sign([l2, ..rest], prev_sign)
        _ -> False
      }
    }
  }
}

fn dampened(report, prev) {
  case report {
    [] -> False
    [l, ..rest] -> {
      let this =
        prev
        |> list.reverse()
        |> list.append(rest)
        |> safe()

      this || dampened(rest, [l, ..prev])
    }
  }
}

fn sign(n) -> Int {
  case n {
    i if i == 0 -> 0
    i if i < 0 -> -1
    i if i > 0 -> 1
    _ -> 0
  }
}

fn setup(input) {
  input
  |> string.trim()
  |> string.split("\n")
  |> list.map(fn(rows) {
    rows
    |> string.split(" ")
    |> list.map(fn(x) {
      case int.parse(x) {
        Ok(i) -> i
        Error(Nil) -> 0
      }
    })
  })
}
