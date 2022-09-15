import { expect } from "chai";
import { ethers, waffle, network } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  let result = await ethers.provider.getStorageAt(victim.address, 1);
  // result = ethers.utils.parseBytes32String(result);
  // console.log(result);
  await victim.unlock(result);
};

export default helper;
