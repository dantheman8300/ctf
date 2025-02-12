import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';
import { writeFile } from 'fs/promises';


const main = async () => {
  console.log('Generating KeyPair...');
  await sleep(1000);

  const keypair = new Ed25519Keypair();

  const publicAddress = keypair.getPublicKey().toSuiAddress();
  const privateKey = keypair.getSecretKey();

  await writeToFile('.env', `PUBLIC_ADDRESS=${publicAddress}\nPRIVATE_KEY=${privateKey}`);
  
  console.log('Public address and private key written to .env file'); 
}

export async function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// Asynchronous example
export async function writeToFile(filename: string, content: string) {
  try {
    await writeFile(filename, content);
  } catch (error) {
    console.error('Error writing file:', error);
  }
}

main().catch(console.error);
