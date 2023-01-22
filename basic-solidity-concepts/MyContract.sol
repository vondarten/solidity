// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // State Variables
    // are stored forever in the blockchain!
    int public stateVariableInt = 1;
    int16 public stateVariableInt16 = 1;
    uint public stateVariable  = 1;
    uint256 public stateVariable256  = 1;
    uint8 public stateVariable8 = 1;

    string public myString = "ethereum";
    bytes32 public myBytes32 = "Hello, World!";

    address public myAddress = 0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005;

    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, world!");

    // Local Variables
    //                         pure = doesnt modify the blockchain
    function getValue() public pure returns (uint){
        uint value = 1;
        return value;
    }
}