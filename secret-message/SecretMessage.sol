// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address owner;   

    modifier onlyOwner() {
        require(msg.sender == owner, "You must be the owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string secret;
    constructor(string memory _secret) {
        secret = _secret;
    }
    function getSecret() public view returns (string memory) {
        return secret;
    }
}

// inheritance in Solidity
contract SecretMessage is Ownable {

    address secretVault;

    string secret;

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return SecretVault(secretVault).getSecret();
    }

}