// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {AggregatorV3Interface} from  "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5 * 1e18;
    function fund() public payable  {
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough eth");
    }

    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer, , , ) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);

    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;

    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        ).version();
    }
}