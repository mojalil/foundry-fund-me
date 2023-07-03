// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    function setUp() external {
        fundMe = new FundMe();
    }

    function testDemo() public{
        assertEq(fundMe.minimumUsd(), 5 * 1e18);
    }
}
