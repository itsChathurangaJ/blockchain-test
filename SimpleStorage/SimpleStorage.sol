// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //^ works with this version or above virsions

contract SimpleStorage {
    uint256 favoriteNumber; // this gets initialized to zero

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    mapping(string => uint256) public nameToFavariteNumber; //dictionary //basically a map -> key,value pair

    People[] public peopleArray;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        //People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //People memory newPerson = People(_favoriteNumber, _name);
        peopleArray.push(People(_favoriteNumber, _name));
        nameToFavariteNumber[_name] = _favoriteNumber;
    }
}

//view or pure fucntions don't modify the state of the contract
//data locations in functions | memory, calldata, storage
//calldata and memory, this data is only temporary and only exist for the duration of the function
//calldata - cannot be modified
//memory - can modify
//storage - are permenant, stay there forever | favoriteNumber is a storage type variable |
//function parameters cannot be storage variables because they only exist for the duration of the function

//when we compile this code, it gets compiled into a EVM
//EVM - Ethereum Virtual Machine | evm is a standard of how to deploy smart contract to ethereum like blockchains
//EVM supported blockchains - Avalache, Fantom, Polygon
