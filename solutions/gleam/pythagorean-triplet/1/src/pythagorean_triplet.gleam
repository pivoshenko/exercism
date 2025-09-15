import gleam/list

pub type Triplet {
  Triplet(Int, Int, Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  use a <- list.flat_map(list.range(1, sum / 3))
  use b <- list.filter_map(list.range(a, sum / 2))
  let c = sum - a - b
  case a * a + b * b - c * c {
    0 -> Ok(Triplet(a, b, c))
    _ -> Error(Nil)
  }
}
