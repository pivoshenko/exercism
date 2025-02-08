import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  list.range(1, n)
  |> list.fold(0, fn(acc: Int, el: Int) { acc + el })
  |> fn(sum) { sum * sum }
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.map(fn(el) { el * el })
  |> list.fold(0, fn(acc: Int, el: Int) { acc + el })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
