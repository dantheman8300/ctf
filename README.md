# ctf

## Table of Contents 
- [Setup](#setup)
- [Slipspace Rupture Challenge](#slipspace-rupture-challenge)
- [Forerunner Database Challenge](#forerunner-database-challenge)
- [Lootbox Challenge](#lootbox-challenge)
- [Merchant Challenge](#merchant-challenge)
- [Piggy Bank Challenge](#piggy-bank-challenge)
- [Vault Challenge](#vault-challenge)

## Setup

1. Navigate to the `scripts` directory: `cd scripts`
2. Install dependencies: `yarn`
3. Run `yarn setup` to generate a keypair and save it to the `.env` file.
4. Run `yarn start` to start the script.

## Slipspace Rupture Challenge

### Challenge Description
Locate the slipspace rupture, wait for it to open, and extract the flag before it closes.

### Instructions
1. Examine the `slipspace_rupture.move` contract carefully
1. Locate the slipspace rupture object that's in the network. 
1. Determine when the rupture will next open.
1. Extract the flag before it closes.

### Hints
1. The rupture object is a globally shared object that was created when the contract was deployed. Find the transaction of the deployment and locate the rupture object.
1. The rupture object has information about when it will next open. 

## Forerunner Database Challenge

### Challenge Description
The forerunner database is a globally shared object that holds thousands of special items including some flags. Locate the database object and extract the flag. 

### Instructions
1. Examine the `forerunner_database.move` contract carefully
1. Locate the forerunner database object that's in the network. 
1. Find a key to extract the flag.
1. Extract the flag.

### Hints
1. The database object is a globally shared object that was created when the contract was deployed. Find the transaction of the deployment and locate the database object.
1. The database contains a list of dynamic object fields, including some flags. Look at all of the dynamic object fields and find one that contains an flag.


## Lootbox Challenge

### Challenge Description
Open a lootbox until you get an flag. 

### Instructions
1. Examine the `lootbox.move` contract carefully.
1. Create new lootboxes until you get an flag.

### Hints
1. Every lootbox has a 1 in 100 chance of containing an flag.
1. Use this [page](https://docs.sui.io/guides/developer/advanced/randomness-onchain#programmable-transaction-block-ptb-restrictions) to learn more about Sui's on-chain randomness. Especially if you are running into this error: `PostRandomCommandRestrictions`
1. A mistake has been made in the `lootbox.move` contract regarding the use of the `Random` object.

## Merchant Challenge 

### Challenge Description
This merchant is selling flags for some native USDC. Buy an flag.

### Instructions
1. Examine the `merchant.move` contract carefully.
1. Find the price of an flag.
1. Get some testnet USDC.
1. Buy an flag.

### Hints
1. The merchant is using a fixed price for the flag.
1. Use this [page](https://sui.io/usdc#start-building) to learn how to get testnet USDC.

## Piggy Bank Challenge

### Challenge Description
Deposit a coin into the piggy bank and get an flag in return.

### Instructions
1. Examine the `piggy_bank.move` contract carefully.
1. Deposit a coin into the piggy bank and get an flag in return.

### Hints
1. The piggy bank only accepts one deposit of each coin type. 
1. Use this [page](https://docs.sui.io/standards/coin#minting-and-burning-coins) to learn how to make your own coin.

## Vault Challenge

### Challenge Description
Create a new key that can unlock the vault and extract the flag.

### Instructions
1. Examine the `vault.move` and `key.move` contracts carefully.
1. Locate the global vault object.
1. Create a new key.
1. Unlock the vault using the key and extract the flag.

### Hints
1. The vault only accepts keys with the correct code.

