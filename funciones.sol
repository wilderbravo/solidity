// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract Number {
    function getNumber() public pure returns (int number) {
        number = 1948;
    }

    function changeNumber() public pure returns (int number) {
        number = getNumber() * -1;
    }

    function sendEther(address payable receiver) public payable{
        receiver.transfer(msg.value);
    }
}