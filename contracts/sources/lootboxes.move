module red_vs_blue::lootboxes;

use sui::random::{Self, Random};
use red_vs_blue::flag;

public fun buy_lootbox(r: &Random, ctx: &mut TxContext): Option<flag::Flag> {
  let mut generator = random::new_generator(r, ctx); // generator is a PRG
  let random_value = generator.generate_u8_in_range(1, 100);

  if (random_value == 42) {
    option::some(flag::new(b"lootbox".to_string(), ctx))
  } else {
    option::none()
  }
}