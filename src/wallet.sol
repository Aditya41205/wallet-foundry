// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
//deployed to -0x33B7C8Cf5FB5d2f6a9a593Ced28cC21Ea3470069 
contract wallet {
    struct owner {
        string name;
        uint256 amount;
        }
        mapping(address => owner) public info;
     function fund(string memory _name) public payable{
require(msg.value > 0, "Not enough to fund");
owner storage Ownerinfo = info[msg.sender];
Ownerinfo.name = _name;Ownerinfo.amount += msg.value;
}
function withdraw(address payable _toSend, uint256 amountToWithdraw) public payable{
    require(info[msg.sender].amount >= amountToWithdraw, "Insufficient funds");
    info[msg.sender].amount -= amountToWithdraw;
    (bool success,)=payable(_toSend).call{value:amountToWithdraw}("");
    require(success,"not valid");
     }
     }