import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed: String = string.trim(remark)

  case trimmed {
    "" -> "Fine. Be that way!"
    _ -> handle_remark(trimmed)
  }
}

fn handle_remark(trimmed: String) -> String {
  let is_shouting: Bool =
    string.uppercase(trimmed) == trimmed && string.lowercase(trimmed) != trimmed
  let is_question: Bool = string.ends_with(trimmed, "?")

  case is_shouting, is_question {
    True, True -> "Calm down, I know what I'm doing!"
    True, False -> "Whoa, chill out!"
    False, True -> "Sure."
    False, False -> "Whatever."
  }
}
