pub type Approval {
  Yes
  No
  Maybe
}

pub type Cusine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cusine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(Romance) -> Yes
    Movie(_) -> No
    Restaurant(Korean) -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(km) -> {
      case km {
        km if km > 6 && km <= 11 -> Maybe
        km if km > 11 -> Yes
        _ -> No
      }
    }
  }
}
