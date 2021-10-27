// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface ICompMint {
    function mint(uint256 id) external;
    function mintWithPermit(uint256 id,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}
