// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "./interfaces/ICompMint.sol";
import "./interfaces/IFungibleToken.sol";

contract CompMint is Ownable, ICompMint {

    IERC1155 public nft;
    IFungibleToken public pmix;

    constructor(IERC1155 _nft, IFungibleToken _pmix) {
        nft = _nft;
        pmix = _pmix;
    }

    function mint(uint256 id) override public {
        nft.safeTransferFrom(address(this), msg.sender, id, 1, "");
        pmix.transferFrom(msg.sender, owner(), 10 ether);
    }
    
    function mintWithPermit(uint256 id,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) override external {
        pmix.permit(msg.sender, address(this), 10 ether, deadline, v, r, s);
        mint(id);
    }
}
