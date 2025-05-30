# Tisbury Treasure Hunt

Welcome to Tisbury Treasure Hunt on Exercism's Gleam Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Tuples

A tuple is an ordered container of values. Like all Gleam data types tuples are immutable.
Each element of a tuple can be of a different type -- they can even be other tuples.

Tuples are defined as comma-separated values between `#(` and `)`: `#(1, 2.0, "Three")`.

```gleam
#("one", 2)      // Tuple pair (2 values)
#("one", 2, 3.0) // Tuple triplet (3 values)
```

Tuples with the same length and the same types (in the same order) can be compared for equality.

```gleam
#(1, 2) == #(1, 2) // Same length, same types, same values, same order
// -> True

#(1, 2) == #(2, 1) // Same length, same types, same values, different order
// -> False

#(1, 2) == #(1, "2") // Same length, different types
// Compile error!

#(1, 2) == #(1, 2, 3) // Different length
// Compile error!
```

There are three ways in which you can get the contained values out of a tuple:

- Indexing.
- Pattern matching with `let`.
- Pattern matching with `case`.

```gleam
let person = #("Jordan", 170)

// Option 1: Indexing
person.0 // -> "Jordan"
person.1 // -> 170

// Option 2: let
let #(name2, length2) = person
// -> name2 = "Jordan"
// -> length2 = 170

// Option 3: case
case person {
  #(name3, length3) -> {
    name3   // -> "Jordan"
    length3 // -> 170
  }
}
```

## Instructions

Aazra and Rui are designing a pirate-themed treasure hunt. There is a list of treasures with map locations, the other a list of place names with map locations.

<table>
<tr><th>Azara's List</th><th></th><th>Rui's List</th></tr>
<tr><td>

| Treasure                    | Location |
| --------------------------- | -------- |
| Amethyst Octopus            | (1, F)   |
| Angry Monkey Figurine       | (5, B)   |
| Antique Glass Fishnet Float | (3, D)   |
| Brass Spyglass              | (4, B)   |
| Carved Wooden Elephant      | (8, C)   |
| Crystal Crab                | (6, A)   |
| Glass Starfish              | (6, D)   |
| Model Ship in Large Bottle  | (8, A)   |
| Pirate Flag                 | (7, F)   |
| Robot Parrot                | (1, C)   |
| Scrimshaw Whale's Tooth     | (1, F)   |
| Silver Seahorse             | (4, E)   |
| Vintage Pirate Hat          | (7, E)   |

</td><td></td><td>

| Place Name                            | Location | Quadrant |
| ------------------------------------- | -------- | -------- |
| Seaside Cottages                      | (C, 1)   | Blue     |
| Aqua Lagoon (Island of Mystery)       | (F, 1)   | Yellow   |
| Deserted Docks                        | (A, 2)   | Blue     |
| Spiky Rocks                           | (D, 3)   | Yellow   |
| Abandoned Lighthouse                  | (B, 4)   | Blue     |
| Hidden Spring (Island of Mystery)     | (E, 4)   | Yellow   |
| Stormy Breakwater                     | (B, 5)   | Purple   |
| Old Schooner                          | (A, 6)   | Purple   |
| Tangled Seaweed Patch                 | (D, 6)   | Orange   |
| Quiet Inlet (Island of Mystery)       | (E, 7)   | Orange   |
| Windswept Hilltop (Island of Mystery) | (F, 7)   | Orange   |
| Harbor Managers Office                | (A, 8)   | Purple   |
| Foggy Seacave                         | (C, 8)   | Purple   |

</td></tr>
</table>

But things are a bit disorganized: Aazra's coordinates appear to be formatted and sorted differently from Rui's, and they have to keep looking from one list to the other to figure out which treasures go with which locations. Being budding Gleamlins, they have come to you for help in writing a small program (a set of functions, really) to better organize their hunt information.

## 1. Convert locations

Implement the `place_location_to_treasure_location` function that takes a place Location (such as `#("C", 1)`) and converts it to a treasure location (such as `#(1, "C")`).

```gleam
place_location_to_treasure_location(#("C", 1))
// -> #(1, "C")
```

## 2. Compare treasure and place locations

Implement the `treasure_location_matches_place_location` function that takes a place location (such as `#("C", 1)`) and returns `True` if it matches a treasure location (such as `#(1, "C")`).

```gleam
treasure_location_matches_place_location(#("C", 1), #(1, "C"))
// -> True

treasure_location_matches_place_location(#("C", 1), #(2, "C"))
// -> False
```

## 3. Count treasure locations

Implement the `count_place_treasures` function, that takes a place (such as `#("Aqua Lagoon (Island of Mystery)", #("F", 1))`), and the list of treasures, and returns the number of treasures that can be found there.

```gleam
let place = #("Aqua Lagoon (Island of Mystery)", #("F", 1))

count_place_treasures(place, treasures)
// -> 2
```

## 4. Special Places

Implement the `special_case_swap_possible` function, which takes a treasure (such as `#("Amethyst Octopus", #(1, "F"))`), a Place (such as `#("Seaside Cottages", #("C", 1))`) and a desired treasure (such as `#("Crystal Crab", #(6, "A"))`), and returns `True` for the following combinations:

- The Brass Spyglass can be swapped for any other treasure at the Abandoned Lighthouse.
- The Amethyst Octopus can be swapped for the Crystal Crab or the Glass Starfish at the Stormy Breakwater.
- The Vintage Pirate Hat can be swapped for the Model Ship in Large Bottle or the Antique Glass Fishnet Float at the Harbor Managers Office.

## Source

### Created by

- @lpil
