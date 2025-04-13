import gleam/int
import gleam/list
import gleam/set

pub fn sum(factors: List(Int), limit: Int) -> Int {
  case factors {
    [] | [0] -> 0

    factors -> {
      factors
      |> list.filter(fn(factor) { factor != 0 })
      |> list.flat_map(fn(factor) { get_multiples(factor, limit) })
      |> set.from_list
      |> set.to_list
      |> int.sum
    }
  }
}

fn get_multiples(factor: Int, limit: Int) -> List(Int) {
  case factor <= 0 {
    True -> []
    False -> {
      list.range(1, limit / factor)
      |> list.map(fn(i) { i * factor })
      |> list.filter(fn(multiple) { multiple < limit })
    }
  }
}
