import { expect } from "chai";
import { ethers, network } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // add code here that will help you pass the test
  for (let i = 0; i < 10; i++) {
    attacker.hackContract();
    await moveBlocks(1, 100);
  }
};

function sleep(timeInMs: any) {
  return new Promise((resolve) => setTimeout(resolve, timeInMs));
}

async function moveBlocks(amount: any, sleepAmount = 0) {
  console.log("Moving blocks...");
  for (let index = 0; index < amount; index++) {
    await network.provider.request({
      method: "evm_mine",
      params: [],
    });
    if (sleepAmount) {
      console.log(`Sleeping for ${sleepAmount}`);
      await sleep(sleepAmount);
    }
  }
  console.log(`Moved ${amount} blocks`);
}

export default helper;
