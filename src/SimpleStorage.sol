// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract SimpleStorage {
    uint256 public s_myFavouriteNumber;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string name => uint256 favNumber) public favOfPeople;

    function store(uint256 _favouriteNumber) public {
        s_myFavouriteNumber = _favouriteNumber;
    }

    function showFavouriteNumber() public view returns (uint256) {
        return s_myFavouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person({favouriteNumber: _favouriteNumber, name: _name}));
        favOfPeople[_name] = _favouriteNumber;
    }
}
