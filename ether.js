import { JsonRpcProvider, Contract, ethers } from "ethers"; 

const provider = new JsonRpcProvider("https://sepolia.infura.io/v3/8025f44f2d4c4e078f5d2f87c767c80a");

const walletAddress = "0x33B7C8Cf5FB5d2f6a9a593Ced28cC21Ea3470069";
const walletAbi = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [
      {
        "internalType": "string",
        "name": "_name",
        "type": "string"
      }
    ],
    "name": "fund",
    "outputs": [],
    "stateMutability": "payable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address payable",
        "name": "_toSend",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "amountToWithdraw",
        "type": "uint256"
      }
    ],
    "name": "withdraw",
    "outputs": [],
    "stateMutability": "payable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "name": "info",
    "outputs": [
      {
        "internalType": "string",
        "name": "name",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "amount",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
];

const walletinteraction = async () => {
  const contractOwnerBalance = await provider.getBalance("0x7f21D6Db0B059496EE1C0810898e35c125A714ab");
  const block= await provider.getBlockNumber();
  console.log(block);
  console.log(contractOwnerBalance);
  

  
};

walletinteraction();
