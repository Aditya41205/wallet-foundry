// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.28;

import {Test} from "forge-std/Test.sol";
import {wallet} from "../src/wallet.sol";

contract WalletTest is Test {
    wallet public walletInstance; 
    address user1 = makeAddr("user1");
    address user2 = makeAddr("user2");

    function setUp() external {
        vm.deal(user1, 100 ether); 
        vm.deal(user2, 100 ether); 
        walletInstance = new wallet(); 
    }

    function testFund() public {
        vm.prank(user1); 
        walletInstance.fund{value: 5 ether}("user1"); 

        
        (string memory name, uint256 amount) = walletInstance.info(user1);

        
        assertEq(name, "user1", "Name mismatch");
        assertEq(amount, 5 ether, "Incorrect amount funded");
    }

   function testWithdrawOnly() public {
    
    vm.prank(user1);
    walletInstance.fund{value: 3 ether}("user1");

   
    vm.prank(user1);
    walletInstance.withdraw(payable(user2), 1 ether);

    (string memory name, uint256 amount) = walletInstance.info(user1);

    
    assertEq(name, "user1", "Name mismatch after withdrawal");
    assertEq(amount, 2 ether, "Incorrect balance after withdrawal");
}

}
