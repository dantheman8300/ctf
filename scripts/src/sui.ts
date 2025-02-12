import { getFullnodeUrl, SuiClient } from "@mysten/sui/client";
import dotenv from 'dotenv';
import { Ed25519Keypair } from "@mysten/sui/keypairs/ed25519";

// use getFullnodeUrl to define Devnet RPC location
export const rpcUrl = getFullnodeUrl('testnet');

// create a client connected to devnet
export const client = new SuiClient({ url: rpcUrl });

dotenv.config();
const PRIVATE_KEY = process.env.PRIVATE_KEY;
export function getAdminAccount() {
  let keypair = Ed25519Keypair.fromSecretKey(PRIVATE_KEY || '');
  return keypair;
}