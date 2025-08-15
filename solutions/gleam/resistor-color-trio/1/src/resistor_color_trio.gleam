import gleam/int
import gleam/string
import gleam/result
import gleam/float

pub type Resistance {
  Resistance(unit: String, value: Int)
}

fn color_to_value(color: String) -> Result(Int, Nil) {
  case string.lowercase(color) {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}

fn format_resistance(ohms: Int) -> Resistance {
  case ohms {
    value if value >= 1_000_000_000 -> 
      Resistance(unit: "gigaohms", value: value / 1_000_000_000)
    value if value >= 1_000_000 -> 
      Resistance(unit: "megaohms", value: value / 1_000_000)
    value if value >= 1_000 -> 
      Resistance(unit: "kiloohms", value: value / 1_000)
    value -> 
      Resistance(unit: "ohms", value: value)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors {
    [first, second, third, ..] -> {
      use first_val <- result.try(color_to_value(first))
      use second_val <- result.try(color_to_value(second))
      use third_val <- result.try(color_to_value(third))
      
      let base_value = first_val * 10 + second_val
      let multiplier = int.power(10, int.to_float(third_val))
      
      case multiplier {
        Ok(mult) -> {
          let ohms = base_value * float.round(mult)
          Ok(format_resistance(ohms))
        }
        Error(_) -> Error(Nil)
      }
    }
    _ -> Error(Nil)
  }
}