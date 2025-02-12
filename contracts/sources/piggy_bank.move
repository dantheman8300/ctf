module red_vs_blue::piggy_bank;

use sui::bag::{Self, Bag};
use sui::coin::{Coin, CoinMetadata};
use red_vs_blue::flag;

public struct PiggyBank has key {
  id: UID,
  bag: Bag,
}

fun init(ctx: &mut TxContext) {
  transfer::share_object(PiggyBank { 
    id: object::new(ctx),
    bag: bag::new(ctx)
  });
}

public fun deposit<CoinType>(bank: &mut PiggyBank, coin: Coin<CoinType>, coin_metadata: &CoinMetadata<CoinType>, ctx: &mut TxContext): flag::Flag {
  let key = coin_metadata.get_symbol();
  bank.bag.add(key, coin);

  flag::new(b"piggy_bank".to_string(), ctx)
}



