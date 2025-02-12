module red_vs_blue::piggy_bank;

use sui::bag;
use sui::coin::{Coin, CoinMetadata};
use red_vs_blue::artifacts;

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

public fun deposit<CoinType>(bank: &mut PiggyBank, coin: Coin<CoinType>, coin_metadata: &CoinMetadata<CoinType>, ctx: &mut TxContext):  artifacts::Artifact {
  let key = coin_metadata.get_symbol();
  bank.bag.add(key, coin);

  artifacts::new(b"piggy_bank".to_string(), ctx)
}



