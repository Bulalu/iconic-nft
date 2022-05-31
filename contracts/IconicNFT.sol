// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyIconicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() ERC721("FunnyNFT", "FUNNY"){
        // console.log("This is my NFT contract. Whoa!");
    }

    function makeAnIconicNFT() public {

        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        // set nft data
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/218N");

        _tokenIds.increment();
    }
}

// Your JSON is hosted at: https://jsonkeeper.com/b/218N