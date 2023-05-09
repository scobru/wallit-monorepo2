//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
// import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * It also allows the owner to withdraw the Ether in the contract
 * @author BuidlGuidl
 */
contract Wallit {
  mapping(address => string) public names;
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function setName(string memory _name) public returns (bool) {
    require(msg.sender == owner, "Only the owner can set the name"); //
    names[msg.sender] = _name;
    return true;
  }

  function getNames(address _addr) public view returns (string memory) {
    return names[_addr];
  }
}
