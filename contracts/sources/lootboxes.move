module red_vs_blue::lootboxes;

use sui::coin::Coin;
use sui::random::{Self, Random};
use usdc::usdc::USDC;
use red_vs_blue::artifacts;
use red_vs_blue::junk;
public enum Lootbox {
  Empty, 
  Prize {
    artifact: artifacts::Artifact,
  }
}

public fun buy_lootbox(r: &Random, ctx: &mut TxContext) {
  let mut generator = random::new_generator(r, ctx); // generator is a PRG
  let random_value = generator.generate_u8_in_range(1, 100);

  if (random_value == 42) {
    transfer::public_transfer(artifacts::new(b"lootbox".to_string(), ctx), ctx.sender());
  } else {
    transfer::public_transfer(junk::new(ctx), ctx.sender());
  };
}

