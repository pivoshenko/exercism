import gleam/list
import gleam/string

type Bracket {
  Round
  Square
  Curly
}

type State {
  Open(bracket: Bracket)
  Close(bracket: Bracket)
  NotBracket
}

fn transform(str: String) -> List(State) {
  str
  |> string.to_graphemes
  |> list.map(fn(c) {
    case c {
      "(" -> Open(Round)
      ")" -> Close(Round)
      "[" -> Open(Square)
      "]" -> Close(Square)
      "{" -> Open(Curly)
      "}" -> Close(Curly)
      _ -> NotBracket
    }
  })
}

fn verify(list: List(State), acc: List(Bracket)) -> Bool {
  case list, acc {
    [Open(c), ..tail], acc -> verify(tail, [c, ..acc])
    [Close(c), ..tail], [b, ..tcc] if c == b -> verify(tail, tcc)
    [NotBracket, ..tail], acc -> verify(tail, acc)
    [], [] -> True
    _, _ -> False
  }
}

pub fn is_paired(value: String) -> Bool {
  verify(transform(value), [])
}
