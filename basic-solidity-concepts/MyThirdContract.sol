// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyThirdContract {
    // Mappings - equivalent to a hash table
    // (key => value)
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "John";
        names[2] = "Paul";
        names[3] = "Isaac";
    }

// underscores before variable are a convention to local vars.
    function addBook(
        uint _id, 
        string memory _title, 
        string memory _author) 
        public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook (
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        //msg.sender: address of the people that called addMyBook
        myBooks[msg.sender][_id] = Book(_title, _author);
    }

}