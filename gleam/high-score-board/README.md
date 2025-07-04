# High Score Board

Welcome to High Score Board on Exercism's Gleam Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Type Aliases

### Type aliases

A type alias can be used in Gleam to give a convenient name for an existing type that would be otherwise cumbersome to write.

```gleam
pub type Headers =
  List(#(String, String))

pub fn html_headers() -> Headers {
  [
    #("content-type", "text/html"),
    #("x-frame-options", "DENY"),
  ]
}
```

When written with `pub type` the alias can be used outside of the module it is defined in. If `pub` is omitted then the alias is private and cannot be referenced in other modules.

## Dicts

Dicts in Gleam are the data structure for storing information in key-value pairs. In other languages, these might also be known as associative arrays, hashes, or dictionaries.

Any type can be used for the keys and values in a dict, and they do not guarantee the order of their entries when accessed or returned.

### Working with dicts

Dicts are created and manipulated using functions from the `gleam/dict` module.

```gleam
// Create an empty dict
let dict1 = dict.new()

// Create a dict with some values
let dict2 = dict.from_list([
  #("name", "Gleam"),
  #("colour", "Pink"),
])

// Add a value to a dict
let dict3 = dict.insert(dict2, "website", "https://gleam.run")

// Get a value from a dict
let name = dict.get(dict3, "name")
// -> Ok("Gleam")
```

## Instructions

In this exercise, you are implementing a way to keep track of the high scores for the most popular game in your local arcade hall.

You have 5 functions to implement, mostly related to manipulating an object that holds high scores.

## 1. Create a new high score board

Create a function `create_score_board` that returns a dict that serves as a high score board.
The keys of this object will be the names of the players, the values will be their scores.
For testing purposes, you want to directly include one entry in the object.
This initial entry should consist of `"The Best Ever"` as player name and `1_000_000` as score.

```gleam
create_score_board()
// returns an object with one initial entry
```

## 2. Add players to a score board

To add a player to the high score board, define the function `add_player`.
It accepts 3 parameters:

- The first parameter is an existing score board dict.
- The second parameter is the name of a player as a string.
- The third parameter is the score as an int.

The function returns a dict with the new player and score added.

## 3. Remove players from a score board

If players violate the rules of the arcade hall, they are manually removed from the high score board.
Define `remove_player` which takes 2 parameters:

- The first parameter is an existing score board dict.
- The second parameter is the name of the player as a string.

This function should return the dict without the player that was removed.

If the player was not on the board in the first place, nothing should happen to the board, it should be returned as is.

## 4. Increase a player's score

If a player finishes another game at the arcade hall, a certain amount of points will be added to the previous score on the board.
Implement `update_score`, which takes 3 parameters:

- The first parameter is an existing score board dict.
- The second parameter is the name of the player whose score should be increased.
- The third parameter is the score that you wish to **add** to the stored high score.

The function should return a dict with the updated score.

If the player was not on the board in the first place, nothing should happen to the board, it should be returned as is.

## 5. Apply Monday bonus points

The arcade hall keeps a separate score board on Mondays.
At the end of the day, each player on that board gets 100 additional points.

Implement the function `apply_monday_bonus` that accepts a score board.
The function returns a dict with the bonus points added for each player that is listed on that board.

## Source

### Created by

- @lpil
