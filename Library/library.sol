// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma abicoder v2;
import "./Ownable.sol";

contract Library is Ownable{

    struct book {
        string title;
        string author;
        uint copies;
    }

    mapping(address=>bool) public NotTaken;
    mapping(uint=>book) public books;

    function addBook (uint _id, string memory _titile, string memory _author, uint _copies) public onlyOwner {

        books[_id]=book(_titile,_author,_copies);
    }

    function borrow (uint _id) public {
        require(NotTaken[msg.sender]=true,"The user has already borrow a book");
        require(books[_id].copies > 0,"No available copies");
        books[_id].copies--;
        NotTaken[msg.sender] == false;

    }
    function retrun (uint _id) public {
        require(NotTaken[msg.sender]=false,"The user has nothing to return");
        books[_id].copies++;
        NotTaken[msg.sender] = true; 
    }


}
