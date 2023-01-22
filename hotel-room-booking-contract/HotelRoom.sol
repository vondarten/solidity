// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    
    // hotel room status: available or occupied

    enum Status {
        Available,
        Occupied
    }

    Status public currentStatus;

    event Occupy(address _occupant, uint _value);

    // address of the smart contract publisher
    address payable public owner;

    constructor() {
    // In first time the contract is published, msg.sender = owner
        owner = payable(msg.sender);
        currentStatus = Status.Available;
    }

    // require() is similar to `assert` in python
    // it requires that the condition is true to let it pass

    modifier onlyWhileAvailable {
        require(currentStatus == Status.Available,
        "Already occupied!");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ethers!");
        _;
    }

    function book() public payable onlyWhileAvailable costs(2 ether) {

        // Verify the price 
       
        currentStatus = Status.Occupied; // Set the current Status
     
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    }
}