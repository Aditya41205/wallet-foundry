// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.28;

import {Script} from "lib/forge-std/src/Script.sol";
import {wallet } from "../src/wallet.sol";

contract Deploywallet is Script{
    function run() external returns(wallet){
        vm.startBroadcast();
        wallet Wallet = new wallet();
        vm.stopBroadcast();
        return Wallet;
    }
}
