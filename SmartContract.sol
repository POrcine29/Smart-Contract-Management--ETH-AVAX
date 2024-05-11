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
