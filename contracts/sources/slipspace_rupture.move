module red_vs_blue::slipspace_rupture;

use sui::clock::Clock;

use red_vs_blue::artifacts;

public struct Rupture has key {
  id: UID,
  next_rupture_timestamp_seconds: u64, 
}

const ENoRuptureOpen: u64 = 0;

const RUPTURE_INTERVAL_SECONDS: u64 = 10 * 60; // 10 minutes

fun init(ctx: &mut TxContext) {
  let rupture = Rupture {
    id: object::new(ctx),
    next_rupture_timestamp_seconds: 0,
  };

  transfer::share_object(rupture);
}

public fun extract_artifact(rupture: &mut Rupture, clock: &Clock, ctx: &mut TxContext): artifacts::Artifact {
  assert!(
    clock.timestamp_ms() / 1000 >= rupture.next_rupture_timestamp_seconds,  
    ENoRuptureOpen
  );

  rupture.next_rupture_timestamp_seconds = clock.timestamp_ms() / 1000 + RUPTURE_INTERVAL_SECONDS;

  artifacts::new(b"slipspace_rupture".to_string(), ctx)
}
