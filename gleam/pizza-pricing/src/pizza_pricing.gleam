import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  tail_recursive_pizza_price(pizza, 0)
}

fn tail_recursive_pizza_price(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> 7 + acc
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
    ExtraSauce(p) -> tail_recursive_pizza_price(p, 1 + acc)
    ExtraToppings(p) -> tail_recursive_pizza_price(p, 2 + acc)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let base_price = tail_recursive_order_price(order, 0)
  let additional_fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  base_price + additional_fee
}

fn tail_recursive_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [item, ..rest] -> tail_recursive_order_price(rest, acc + pizza_price(item))
  }
}
