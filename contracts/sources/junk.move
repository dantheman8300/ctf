module red_vs_blue::junk;

public struct Junk has key, store {
  id: UID  
}

public fun new(ctx: &mut TxContext): Junk {
  let junk = Junk {
    id: object::new(ctx),
  };
  junk
}

public fun delete(junk: Junk) {
  let Junk { id } = junk;
  id.delete();
}

