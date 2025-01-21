//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployToken} from "../script/DeployToken.s.sol";

contract OurTokenTest is Test {
    OurToken public ot;
    DeployToken public dt;

    uint256 public constant STARTING_BAL = 100 ether;

    address bob = makeAddr("bob");

    function setUp() public {
        dt = new DeployToken();
        ot = dt.run();

        vm.prank(msg.sender);
        ot.transfer(bob, STARTING_BAL);
    }

    function testBobBalance() public view {
        assertEq(STARTING_BAL, ot.balanceOf(bob));
    }
}
