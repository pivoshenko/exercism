pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(current_minutes_in_oven: Int) -> Int {
  let expected_minutes_in_oven = expected_minutes_in_oven()
  expected_minutes_in_oven - current_minutes_in_oven
}

pub fn preparation_time_in_minutes(num_layers: Int) -> Int {
  num_layers * 2
}

pub fn total_time_in_minutes(
  num_layers: Int,
  current_minutes_in_oven: Int,
) -> Int {
  preparation_time_in_minutes(num_layers) + current_minutes_in_oven
}

pub fn alarm() -> String {
  "Ding!"
}
