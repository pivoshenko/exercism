# Wine Cellar

Welcome to Wine Cellar on Exercism's Gleam Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Labelled Arguments

Sometimes when a function takes many arguments it can be difficult to remember the order they should be given in. To aid readability Gleam allows arguments to be labelled with a name.

To label an argument specify the label name before the argument name, separated by a space.

```gleam
pub fn replace(
  in string: String,
  each target: String,
  with replacement: String
) -> String {
  // ...
}
```

When calling a function with labelled arguments the arguments can be given in any order. Each of these calls to `replace` are equivalent:

```gleam
replace(in: "🍔🍔🍔", each: "🍔", with: "🍕")

replace(each: "🍔", in: "🍔🍔🍔", with: "🍕")

replace(with: "🍕", each: "🍔", in: "🍔🍔🍔")
```

Labels are always optional. Even if a function has labelled arguments they can still be called without labels.

```gleam
replace("🍔🍔🍔", "🍔", "🍕")
```

## Instructions

You are the manager of a fancy restaurant that has a sizable wine cellar. A lot of your customers are demanding wine enthusiasts. Finding the right bottle of wine for a particular customer is not an easy task.

As a tech-savvy restaurant owner, you decided to speed up the wine selection process by writing an app that will let guests filter your wines by their preferences.

## 1. Get all wines of a given color

A bottle of wine is represented using a custom type, and wines are stored in a list.

```gleam
[
  Wine("Chardonnay", 2015, "Italy", White),
  Wine("Pinot grigio", 2017, "Germany", White),
  Wine("Pinot noir", 2016, "France", Red),
  Wine("Dornfelder", 2018, "Germany", Rose)
]
```

Implement the `wines_of_color` function. It should take a list of wines and return all wines of a given color.

```gleam
wines_of_color(
  [
    Wine("Chardonnay", 2015, "Italy", White),
    Wine("Pinot grigio", 2017, "Germany", White),
    Wine("Pinot noir", 2016, "France", Red),
    Wine("Dornfelder", 2018, "Germany", Rose)
  ],
  color: White
)
// -> [
//   Wine("Chardonnay", 2015, "Italy", White),
//   Wine("Pinot grigio", 2017, "Germany", White),
// ]
```

## 2. Get all wines bottles in a given country

Implement the `wines_from_country` function. It should take a list of wines and return all wines from a given country.

```gleam
wines_from_country(
  [
    Wine("Chardonnay", 2015, "Italy", White),
    Wine("Pinot grigio", 2017, "Germany", White),
    Wine("Pinot noir", 2016, "France", Red),
    Wine("Dornfelder", 2018, "Germany", Rose)
  ],
  country: "Germany"
)
// -> [
//   Wine("Dornfelder", 2018, "Germany", Rose)
// ]
```

## 3. Get all wines of a given color bottled in a given country

Implement the `filter` function. It should take a list of wines, a color and a country and return all wines of the given color bottled in the given country.

```gleam
filter(
  [
    Wine("Chardonnay", 2015, "Italy", White),
    Wine("Pinot grigio", 2017, "Germany", White),
    Wine("Pinot noir", 2016, "France", Red),
    Wine("Dornfelder", 2018, "Germany", Rose)
  ],
  color: White
  country: "Italy"
)
// -> [
//   Wine("Chardonnay", 2015, "Italy", White),
// ]
```

## Source

### Created by

- @lpil
