// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./interfaces/ICompMint.sol";
import "./interfaces/IFungibleToken.sol";

contract CompMint is Ownable, ICompMint, IERC1155Receiver, ERC165 {

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

    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    ) external override returns (bytes4) {
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }

    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    ) external override returns (bytes4) {
        return bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"));
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return interfaceId == type(IERC1155).interfaceId || super.supportsInterface(interfaceId);
    }
}
