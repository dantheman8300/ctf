module red_vs_blue::forerunner_database;

use std::string::String;
use sui::dynamic_object_field;
use red_vs_blue::flag;
use red_vs_blue::junk;

public struct ForerunnerDatabase has key {
  id: UID,
}

fun init(ctx: &mut TxContext) {
  let db = ForerunnerDatabase {
    id: object::new(ctx),
  };
  transfer::share_object(db);
}

public fun load(db: &mut ForerunnerDatabase, keys: vector<String>, fills: vector<u64>, ctx: &mut TxContext) {
  assert!(keys.length() == fills.length(), 0);

  let mut keys = keys;
  let mut fills = fills;

  while (keys.length() > 0) {
    let key = keys.pop_back();
    let fill = fills.pop_back();

    if (fill == 0) {
      let junk = junk::new(ctx);
      dynamic_object_field::add(&mut db.id, key, junk);
    } else {
      let flag = flag::new(key, ctx);
      dynamic_object_field::add(&mut db.id, key, flag);
    };
  };
}

public fun extract<Item: key + store>(db: &mut ForerunnerDatabase, key: String): Item {
  dynamic_object_field::remove(&mut db.id, key)
}