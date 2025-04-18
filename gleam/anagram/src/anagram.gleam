import gleam/list
import gleam/string

pub fn prepare(word: String) -> List(String) {
  string.to_graphemes(word)
  |> list.map(fn(el) { string.lowercase(el) })
  |> list.sort(string.compare)
}

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(el) { string.lowercase(el) != string.lowercase(word) })
  |> list.filter(fn(el) { prepare(el) == prepare(word) })
}
