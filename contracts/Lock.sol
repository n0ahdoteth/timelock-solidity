pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Lock {

    using SafeMath for uint;

    mapping(address => uint) public balances;
    mapping(address => uint) public lockTime;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        
        lockTime[msg.sender] += block.timestamp + 1 years;
    }

    function withdraw() external payable{
        require(balances[msg.sender] > 0, "You have no money to withdraw at this moment.");
        require(block.timestamp > lockTime[msg.sender], "Please wait until the time has passed.");

        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "failed to send ether");
    }
}
