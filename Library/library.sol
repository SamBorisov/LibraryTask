// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma abicoder v2;
import "./Ownable.sol";

contract Library is Ownable{

    struct book {
        uint id;
        string title;
        string author;
        uint copies;
    }

    mapping(uint=>book) public books;
    mapping(address=>mapping(uint=>bool)) public NotTaken;

    function addBook (uint _id, string memory _titile, string memory _author, uint _copies) public onlyOwner {

        books[_id]=book(_id, _titile,_author,_copies);
    }

    function borrow (uint _id) public {
        require(NotTaken[msg.sender][_id] == false,"The user has already borrow a book");
        require(books[_id].copies > 0,"No available copies");
        books[_id].copies--;
        NotTaken[msg.sender][_id] = true;


    }
    function retrun (uint _id) public {
        require(NotTaken[msg.sender][_id] == true,"The user has nothing to return");
        books[_id].copies++;
        NotTaken[msg.sender][_id] = false; 
    }


}
