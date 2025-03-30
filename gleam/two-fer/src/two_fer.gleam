import gleam/option.{type Option, None, Some, unwrap}

pub fn two_fer(name: Option(String)) -> String {
  case name {
    Some(_) -> "One for " <> unwrap(name, "") <> ", one for me."
    None -> "One for you, one for me."
  }
}
