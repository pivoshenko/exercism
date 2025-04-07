import gleam/list
import gleam/set
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(fn(char) { char != "-" && char != " " })
  |> check_no_duplicates
}

fn check_no_duplicates(chars: List(String)) -> Bool {
  let unique_chars = set.from_list(chars)
  set.size(unique_chars) == list.length(chars)
}
