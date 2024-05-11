# Smart-Contract-Management--ETH-AVAX

A smart contract is a type of program, written in a specific programming language, that exists on a blockchain. Its code takes the form of if-then statements, where the logic is executed once certain conditions are fulfilled. 

## Description

smart contracts is a tool that facilitates their development, implementation, and upkeep. Without requiring in-depth coding knowledge, users may build, test, and monitor smart contracts with our management platform's tools and interfaces that streamline these procedures.

## Getting Started

### Installing

Open your web browser and navigate to Remix IDE. 

https://remix.ethereum.org/

Click on the file icon in the File Explorer tab to create a new file and name it `MySmartContract.sol`.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract VendingMachine {
    // Declare state variables of the contract
    address public owner;
    mapping(address => uint256) public cupcakeBalances;

    constructor() {
        owner = msg.sender;
        cupcakeBalances[address(this)] = 100;
    }

    // Allow the owner to increase the smart contract's cupcake balance
    function refill(uint amount) public {
        require(msg.sender == owner, "Only the owner can refill.");
        cupcakeBalances[address(this)] += amount;
    }

    // Allow anyone to purchase cupcakes
    function purchase(uint256 amount) public payable {
        require(msg.value >= amount * 1 ether, "Insufficient ether sent. You must pay at least 1 ETH per cupcake");
        require(cupcakeBalances[address(this)] >= amount, "Not enough cupcakes in stock to complete this purchase");    
        
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;

        // Refund any excess ether sent
        if (msg.value > amount * 1 ether) {
            payable(msg.sender).transfer(msg.value - amount * 1 ether);
        }
    }
}

```

2.Copy and paste the code into the remix online IDE editor 

3.Click the blue button in the side tab which Compile and see if it is successful

4. Click the deploy and run the transaction

5. Once you see if it is successful click the side button of your contracts and put the purchase amount and refill

6.Once you click this copy your account to the address and click the call and the owner to see if it is successful

## Authors

Orcine,Poliana J.
8210778@ntc.edu.ph
