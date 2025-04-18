pub fn convert(number: Int) -> String {
  let roman_numerals: List(#(Int, String)) = [
    #(1000, "M"),
    #(900, "CM"),
    #(500, "D"),
    #(400, "CD"),
    #(100, "C"),
    #(90, "XC"),
    #(50, "L"),
    #(40, "XL"),
    #(10, "X"),
    #(9, "IX"),
    #(5, "V"),
    #(4, "IV"),
    #(1, "I"),
  ]

  convert_inner(number, roman_numerals, "")
}

fn convert_inner(
  number: Int,
  numerals: List(#(Int, String)),
  accumulator: String,
) -> String {
  case numerals {
    [] -> accumulator
    [first, ..rest] -> {
      let #(value, numeral) = first
      case number >= value {
        True -> convert_inner(number - value, numerals, accumulator <> numeral)
        False -> convert_inner(number, rest, accumulator)
      }
    }
  }
}
