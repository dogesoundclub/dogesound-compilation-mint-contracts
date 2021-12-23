// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CompV2MintStarter is Ownable {

    bool public started;

    function start() onlyOwner external {
        started = true;
    }
}
