module red_vs_blue::merchant {
    
    use sui::coin::Coin;
    use usdc::usdc::USDC;
    use red_vs_blue::flag;

    const COST_PER_FLAG: u64 = 5849000;

    const EInvalidPaymentAmount: u64 = 0;

    public fun buy_flag(payment_coin: Coin<USDC>, ctx: &mut TxContext): flag::Flag {
        assert!(payment_coin.value() == COST_PER_FLAG, EInvalidPaymentAmount);
        transfer::public_transfer(payment_coin, @0x0);

        flag::new(b"merchant".to_string(), ctx)
    }
}

