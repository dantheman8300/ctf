module red_vs_blue::vault {

  use red_vs_blue::key;
  use red_vs_blue::flag;

  public struct Vault has key {
    id: UID,
    code: u64
  }

  public struct AdminCap has key, store {
    id: UID, 
    vault_id: ID
  }

  public fun new(
    code: u64,
    ctx: &mut TxContext
  ): AdminCap {
    let new_vault = Vault {
      id: object::new(ctx),
      code
    };

    let new_admin_cap = AdminCap {
      id: object::new(ctx), 
      vault_id: object::uid_to_inner(&new_vault.id)
    };

    transfer::share_object(
      new_vault
    );

    new_admin_cap  
  }

  public fun withdraw(vault: &mut Vault, key: key::Key, ctx: &mut TxContext): flag::Flag {
    assert_valid_key_code(vault, &key);
    key::delete(key);

    flag::new(b"vault".to_string(), ctx)
  }

  fun assert_valid_key_code(vault: &Vault, key: &key::Key) {
    assert!(vault.code == key::get_code(key));
  }

}