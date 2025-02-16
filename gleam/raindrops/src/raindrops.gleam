import gleam/int
import gleam/string

pub fn convert(number: Int) -> String {
  let sound =
    ""
    |> raindrop(number, 3, "Pling")
    |> raindrop(number, 5, "Plang")
    |> raindrop(number, 7, "Plong")

  case string.is_empty(sound) {
    True -> int.to_string(number)
    False -> sound
  }
}

fn raindrop(
  accumulator: String,
  number: Int,
  divisor: Int,
  sound: String,
) -> String {
  case number % divisor {
    0 -> accumulator <> sound
    _ -> accumulator
  }
}
