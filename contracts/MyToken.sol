// SPDX-License-Identifier: MIT
    pragma solidity >=0.8.0  <0.9.0;
    
    import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";
    
    contract Kanas is ERC721 {

        address public owner;
        string constant baseURI = "https://ipfs.filebase.io/ipfs/QmXAkSYQMTn6mBf13AZmiKotqqCpQPJDrUCfMg2m47igTR";

    
        constructor() ERC721("Kanas ", "KAN") {
            owner = msg.sender;
        }
    
        function mint(address to, uint256 tokenId) public {
            _mint(to, tokenId);
        }
    
        function _baseURI() internal pure override returns (string memory) {
            return baseURI;
        }
    
        function tokenURI(uint256 tokenId) public view override returns (string memory) {
            require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
            
            return baseURI;
        }
    }