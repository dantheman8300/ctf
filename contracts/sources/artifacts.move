module red_vs_blue::artifacts;

use std::string::String;

public struct Artifact has key, store {
  id: UID,
  source: String
}

public(package) fun new(source: String, ctx: &mut TxContext): Artifact {
  let artifact = Artifact {
    id: object::new(ctx),
    source,
  };
  artifact
}

public fun delete(artifact: Artifact) {
  let Artifact { id, source: _ } = artifact;
  id.delete();
}
