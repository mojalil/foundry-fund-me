# FundMe
FundMe is a crowdfunding platform built on the Ethereum blockchain. It allows users to fund the contract with Ether (ETH). The contract uses Chainlink's AggregatorV3Interface to convert the ETH amount to USD.

## Installation
To install the project, you need to have Truffle installed. You can install it globally with npm:
```
npm install -g truffle
```
Then, clone the repository and install the dependencies:
```git clone https://github.com/mojalil/foundry-fund-me.git
cd foundry-fund-me
npm install
```

## Usage
To compile the contract, use Truffle:

```
truffle compile
```
To deploy the contract to a local Ethereum blockchain, you can use Ganache and then run:

```
truffle migrate
```

## Contract Details
The contract has the following main functions:

fund(): Allows a user to fund the contract. The function requires that the ETH amount converted to USD is greater than a minimum amount.

withdraw(): Allows the contract owner to withdraw all funds. It resets the funded amount for each funder and clears the list of funders.

getFunder(uint256 index): Returns the address of a funder based on the index.

getAddressToAmountFunded(address fundingAddress): Returns the amount funded by a specific address.

getOwner(): Returns the owner of the contract.

The contract also includes a fallback function and a receive function that call the fund() function when the contract receives Ether without a function being called.

## Contributing
Contributions are welcome. Please open an issue or submit a pull request.

## License
This project is licensed under the MIT license.

