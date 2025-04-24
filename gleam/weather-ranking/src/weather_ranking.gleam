import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub const offset: Float = 32.0

pub const scale: Float = 1.8

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. offset } /. scale
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(l), Celsius(r) -> float.compare(l, r)
    Celsius(l), Fahrenheit(r) -> float.compare(l, r |> fahrenheit_to_celsius)
    Fahrenheit(l), Celsius(r) -> float.compare(l |> fahrenheit_to_celsius, r)
    Fahrenheit(l), Fahrenheit(r) ->
      float.compare(l |> fahrenheit_to_celsius, r |> fahrenheit_to_celsius)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, by: fn(left, right) {
    compare_temperature(left.temperature, right.temperature)
  })
}
