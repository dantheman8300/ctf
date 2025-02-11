module red_vs_blue::merchant;

use sui::coin::Coin;
use usdc::usdc::USDC;
use red_vs_blue::artifacts;

const COST_PER_ARTIFACT: u64 = 5849000;

const EInvalidPaymentAmount: u64 = 0;

public fun buy_artifact(payment_coin: Coin<USDC>, ctx: &mut TxContext): artifacts::Artifact {
  assert!(payment_coin.value() == COST_PER_ARTIFACT, EInvalidPaymentAmount);
  transfer::public_transfer(payment_coin, @0x0);

  artifacts::new(b"merchant".to_string(), ctx)
}

