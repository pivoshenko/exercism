import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let #(new_direction, new_position) =
    instructions
    |> string.to_graphemes
    |> list.fold(#(direction, position), fn(acc, instruction: String) {
      case instruction {
        "R" -> #(change_direction(instruction, acc.0), acc.1)
        "L" -> #(change_direction(instruction, acc.0), acc.1)
        "A" -> #(acc.0, advance(acc.1, acc.0))
        _ -> acc
      }
    })

  Robot(new_direction, new_position)
}

fn advance(position: Position, direction: Direction) -> Position {
  case direction {
    North -> Position(position.x, position.y + 1)
    East -> Position(position.x + 1, position.y)
    South -> Position(position.x, position.y - 1)
    West -> Position(position.x - 1, position.y)
  }
}

fn change_direction(instruction: String, direction: Direction) -> Direction {
  case instruction, direction {
    "R", North -> East
    "R", East -> South
    "R", South -> West
    "R", West -> North
    "L", North -> West
    "L", West -> South
    "L", South -> East
    "L", East -> North
    _, direction -> direction
  }
}
