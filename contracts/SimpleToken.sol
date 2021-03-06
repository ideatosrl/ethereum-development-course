pragma solidity ^0.4.23;

import "./ConvertLib.sol";

contract SimpleToken {
    mapping (address => uint) balances;
    event Transfer(address receiver);

    constructor() public {
        balances[msg.sender] = 10000;
    }

    function transfer(address receiver, uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] < amount) {
            return false;
        }
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit Transfer(receiver);
    
        return true;
    }

    function getBalanceInEth(address addr) public view returns(uint){
        return ConvertLib.convert(getBalance(addr),2);  
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    }
}
