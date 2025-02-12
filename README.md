# ctf
Welcome to the the CTF! Complete each of the challenges to extract the flags and win the CTF!

## Table of Contents 
- [Setup](#setup)
- [Vault Challenge](#vault-challenge)
- [Slipspace Rupture Challenge](#slipspace-rupture-challenge)
- [Forerunner Database Challenge](#forerunner-database-challenge)
- [Lootbox Challenge](#lootbox-challenge)
- [Merchant Challenge](#merchant-challenge)
- [Piggy Bank Challenge](#piggy-bank-challenge)

## Setup

1. Navigate to the `scripts` directory: `cd scripts`
2. Install dependencies: `yarn`
3. Run `yarn setup` to generate a keypair and save it to the `.env` file.
4. Run `yarn start` to start the script.

## Resources

- Deployed package address: ``
- Sui Explorer: [https://suiscan.xyz/testnet/home](https://suiscan.xyz/testnet/home)
- Sui Faucet: [https://faucet.sui.io/](https://faucet.sui.io/) OR [Discord faucet](https://discord.gg/cKx75xrRMq)
- Sui Docs: [https://docs.sui.io/](https://docs.sui.io/)
- Sui Move Book: [https://move-book.com/](https://move-book.com/)
- Sui Typescript SDK: [https://sdk.mystenlabs.com/typescript](https://sdk.mystenlabs.com/typescript)
- Sui Standard Library Framework: [https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs)
- Sui CLI Installation: [https://docs.sui.io/guides/developer/getting-started/sui-install](https://docs.sui.io/guides/developer/getting-started/sui-install)

## Vault Challenge
Create a new key that can unlock the vault and extract the flag.

### Instructions
1. Examine the [`vault.move`](./contracts/sources/vault.move) and [`key.move`](./contracts/sources/key.move) contracts carefully.
2. Locate the global vault object.
3. Create a new key.
4. Unlock the vault using the key and extract the flag.

### Hints
1. The vault is a globally shared object that was created shortly after the contract was deployed. Find the transaction of the creation and locate the vault object.
2. The vault only accepts keys with the correct code.
3. The vault has information about the code it will accept.

## Slipspace Rupture Challenge
Locate the slipspace rupture, wait for it to open, and extract the flag before it closes.

### Instructions
1. Examine the [`slipspace_rupture.move`](./contracts/sources/slipspace_rupture.move) contract carefully
2. Locate the slipspace rupture object. 
3. Determine when the rupture will next open.
4. Extract the flag before it closes.

### Hints
1. The rupture object is a globally shared object that was created when the contract was deployed. Find the transaction of the deployment and locate the rupture object.
2. The rupture object has information about when it will next open. 

## Merchant Challenge 

### Challenge Description
This merchant is selling flags for some native USDC. Buy an flag.

### Instructions
1. Examine the [`merchant.move`](./contracts/sources/merchant.move) contract carefully.
2. Get some testnet USDC.
3. Find the price of an flag.
4. Buy an flag.

### Hints
1. Use this [page](https://sui.io/usdc#start-building) to learn how to get testnet USDC.
2. The merchant is using a fixed price for the flag.

## Forerunner Database Challenge
The forerunner database is a globally shared object that holds thousands of special items including some flags. Locate the database object and extract the flag. 

### Instructions
1. Examine the [`forerunner_database.move`](./contracts/sources/forerunner_database.move) contract carefully
2. Locate the forerunner database object. 
3. Find a key to extract the flag.
4. Extract the flag.

### Hints
1. The database object is a globally shared object that was created when the contract was deployed. Find the transaction of the deployment and locate the database object.
2. The database contains a list of dynamic object fields, including some flags. Look at all of the dynamic object fields and find one that contains an flag. The sui client has a function to list all of the dynamic fields for an object: `getDynamicFields`.

## Lootbox Challenge
Open lootboxes until you get an flag. 

### Instructions
1. Examine the [`lootboxes.move`](./contracts/sources/lootboxes.move) contract carefully
2. Create new lootboxes until you get an flag.

### Hints
1. Every lootbox has a 1 in 100 chance of containing an flag.
2. Use this [page](https://docs.sui.io/guides/developer/advanced/randomness-onchain#programmable-transaction-block-ptb-restrictions) to learn more about Sui's on-chain randomness. Especially if you are running into this error: `PostRandomCommandRestrictions`
3. A mistake has been made in the `lootbox.move` contract regarding the use of the `Random` object.

## Piggy Bank Challenge
Deposit a coin into the piggy bank and get an flag in return.

### Instructions
1. Examine the [`piggy_bank.move`](./contracts/sources/piggy_bank.move) contract carefully.
2. Deposit a coin into the piggy bank and get an flag in return.

### Hints
1. The piggy bank only accepts one deposit of each coin type. 
2. Use this [page](https://docs.sui.io/standards/coin#minting-and-burning-coins) to learn how to make your own coin.

