//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "forge-std/Test.sol";

import {Greeter} from "../../contracts/Greeter.sol";

import {SemaphoreVerifier} from "@semaphore-protocol/contracts/base/SemaphoreVerifier.sol";
import {Semaphore} from "@semaphore-protocol/contracts/Semaphore.sol";

contract GreeterTest is Test {
    Greeter public greeter;

    event NewUser(uint256 identityCommitment, bytes32 username);

    mapping(uint256 => bytes32) users;

    function setUp() public {
        SemaphoreVerifier verifier = new SemaphoreVerifier();
        Semaphore semaphore = new Semaphore(verifier);
        greeter = new Greeter(address(semaphore), 0);
        users[0] = bytes32("Anon0");
        users[1] = bytes32("Anon1");
    }

    function testJoinGroup() public {
        vm.expectEmit(true, true, true, true);
        emit NewUser(0, bytes32("Anon0"));
        greeter.joinGroup(0, users[0]);
    }
}
