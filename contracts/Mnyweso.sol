// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract Mnyweso is  Pausable, Ownable, ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    string public jeezURI;
    constructor() ERC721("Mnyweso", "MIKE") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }


    function _baseURI() internal view override returns (string memory) {
        return jeezURI;
    }

    function setTokenURI(string memory _tokenURI) external  onlyOwner {
        jeezURI = _tokenURI;
    } 
    
    /**
    * @dev Returns an URI for a given token ID
    */
     function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        

       
        string memory base = _baseURI();

        // Just for testing there will always be a token URI
        return base;
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }
}


