import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  list |> list.map(fun)
}
