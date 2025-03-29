import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, player.level {
    0, l if l >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
    0, l if l < 10 -> Some(Player(..player, health: 100))
    _, _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(m) if m < cost -> #(player, 0)
    Some(m) -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
  }
}
