module red_vs_blue::flag;

use std::string::String;

use red_vs_blue::artifacts;

public struct Flag has key, store {
  id: UID,
  team_color: String
}

const EInvalidArtifactCount: u64 = 0;

fun new(team_color: String, ctx: &mut TxContext): Flag {
  let flag = Flag {
    id: object::new(ctx),
    team_color,
  };
  flag
}

public fun exchange(team_color: String, artifacts: vector<artifacts::Artifact>, ctx: &mut TxContext): Flag {
  assert!(
    artifacts.length() == 5,
    EInvalidArtifactCount
  );

  let flag = new(team_color, ctx);
  let mut artifacts = artifacts;

  while (artifacts.length() > 0) {
    let artifact = artifacts.pop_back();
    artifacts::delete(artifact);
  };

  artifacts.destroy_empty();

  flag
}