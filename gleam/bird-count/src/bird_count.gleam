import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days |> list.first() {
    Error(Nil) -> 0
    Ok(el) -> el
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [f_el, ..rest] -> [f_el + 1, ..rest]
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days |> list.is_empty() {
    True -> False
    _ -> days |> list.any(fn(el) { el == 0 })
  }
}

pub fn total(days: List(Int)) -> Int {
  days |> list.fold(0, int.add)
}

pub fn busy_days(days: List(Int)) -> Int {
  days |> list.filter(fn(el) { el >= 5 }) |> list.length()
}
