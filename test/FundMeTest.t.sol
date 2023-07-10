// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    // for the purpose of testing, we can make / mock an address
    // that is the same as the msg.sender

    address USER = makeAddr("user");


    // Decimals do not work in solidity but with ether keyword we can
    uint256 constant SEND_VALUE = 0.1 ether;

    uint256 constant STARTING_BALANCE = 5 * 1e18;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        // give our test user some amount of ether
        vm.deal(USER, STARTING_BALANCE);
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5 * 1e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();

        assertEq(version, 4);
    }

    function testFundFailsWithoutEnoughETH() public {
        // We expect a revert, using the foundry cheatcode we can test for this
        vm.expectRevert();
        fundMe.fund();
    }

    function testFundUpdatesFundedDataStructure() public {
        vm.prank(USER); // The next TX will be from USER
        fundMe.fund{value: SEND_VALUE}();
        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded, SEND_VALUE);
    }
}
