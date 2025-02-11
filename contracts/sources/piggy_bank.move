module red_vs_blue::piggy_bank;

use sui::bag;
use sui::coin::{Coin, CoinMetadata};
public struct PiggyBank has key {
  id: UID,
  bag: bag::Bag,
}

fun init(ctx: &mut TxContext) {
  transfer::share_object(PiggyBank { 
    id: object::new(ctx),
    bag: bag::new(ctx)
  });
}

public fun deposit<CoinType>(bank: &mut PiggyBank, coin: Coin<CoinType>, coin_metadata: &CoinMetadata<CoinType>) {
  let key = coin_metadata.get_symbol();
  bank.bag.add(key, coin);
}



