import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { Transaction } from '@mysten/sui/transactions';
import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';
import dotenv from 'dotenv';
 
// use getFullnodeUrl to define Devnet RPC location
const rpcUrl = getFullnodeUrl('devnet');

// create a client connected to devnet
const client = new SuiClient({ url: rpcUrl });

dotenv.config();

const PRIVATE_KEY = process.env.PRIVATE_KEY;

export function getAdminAccount() {
  let keypair = Ed25519Keypair.fromSecretKey(PRIVATE_KEY || '');
  return keypair;
}

const PACKAGE_ADDRESS = '0x32909f9ef1a0e51b82e4141fcc24a79a78e9fa08a58ee9b507ccf63fb2dcd17b';
const admin_cap = '0x889bd3f5f6775a9ff0619c63c0a93570be73c265f5300d39b86ab119e3b26518';
const db_id = '0x2e2f253f66b758961840db35eefff6aab72480f539db2530e2b9d66573fb7e34';
const rupture_id = '0xb3d38c219f1ad4d10017c842d33ea5c5bfdc8ea7923ead1501e59c3f0adea2f1';

const main = async () => {
  // await load_db();

  // await extract_artifact_from_db("key18");

  await extract_artifact_from_rupture();

  const res = await client.getDynamicFields({
    parentId: db_id
  });

  console.log(JSON.stringify(res, null, 2));
}

const load_db = async () => {
  const tx = new Transaction();

  tx.moveCall({
    target: `${PACKAGE_ADDRESS}::forerunner_database::load`,
    arguments: [
      tx.object(admin_cap), 
      tx.object(db_id),
      tx.pure.vector("string", ["key1", "key2", "key3", "key4", "key5", "key6", "key7", "key8", "key9", "key10", "key11", "key12", "key13", "key14", "key15", "key16", "key17", "key18", "key19", "key20"]),
      tx.pure.vector("u64", ["0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "0", "1", "0", "1"])
    ]
  });

  const res = await client.signAndExecuteTransaction({
    transaction: tx,
    signer: getAdminAccount()
  });

  console.log(res);
}

const extract_artifact_from_db = async (key: string) => {
  const tx = new Transaction();

  const artifact = tx.moveCall({
    target: `${PACKAGE_ADDRESS}::forerunner_database::extract`, 
    typeArguments: [`${PACKAGE_ADDRESS}::artifacts::Artifact`],
    arguments: [
      tx.object(db_id),
      tx.pure.string(key)
    ]
  });

  tx.transferObjects(
    [artifact], 
    getAdminAccount().toSuiAddress()
  );

  const res = await client.signAndExecuteTransaction({
    transaction: tx,
    signer: getAdminAccount()
  });

  console.log(res);
}

const extract_artifact_from_rupture = async () => {
  const tx = new Transaction();

  const artifact = tx.moveCall({
    target: `${PACKAGE_ADDRESS}::slipspace_rupture::extract_artifact`,
    arguments: [
      tx.object(rupture_id),
      tx.object.clock()
    ]
  })

  tx.transferObjects(
    [artifact], 
    getAdminAccount().toSuiAddress()
  );

  const res = await client.signAndExecuteTransaction({
    transaction: tx,
    signer: getAdminAccount()
  });

  console.log(res);
}

main().catch(console.error);