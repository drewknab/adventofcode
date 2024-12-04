import gleam/io
import historian_hysteria
import red_nosed_reports
import tempo/duration

pub fn main() {
  timed(historian_hysteria.part_1)
  timed(historian_hysteria.part_2)
  timed(red_nosed_reports.part_1)
  timed(red_nosed_reports.part_2)
}

pub fn timed(func) {
  let start = duration.start_monotonic()
  func() |> io.debug
  io.println("This took " <> duration.since(start) <> " to run!")
}
