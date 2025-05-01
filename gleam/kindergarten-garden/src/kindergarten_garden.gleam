import gleam/list
import gleam/string

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

fn student_to_index(student: Student) -> Int {
  case student {
    Alice -> 0
    Bob -> 1
    Charlie -> 2
    David -> 3
    Eve -> 4
    Fred -> 5
    Ginny -> 6
    Harriet -> 7
    Ileana -> 8
    Joseph -> 9
    Kincaid -> 10
    Larry -> 11
  }
}

fn letter_to_plant(letter: String) -> Plant {
  case letter {
    "R" -> Radishes
    "C" -> Clover
    "V" -> Violets
    "G" -> Grass
    _ -> panic as "invalid letter"
  }
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  string.split(diagram, "\n")
  |> list.flat_map(fn(row) {
    row
    |> string.slice(student_to_index(student) * 2, 2)
    |> string.to_graphemes
    |> list.map(letter_to_plant)
  })
}
