// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Fruitshop {
  mapping(address => uint) myApple;

  constructor() public {
  }

  function buyApple() payable external {
    myApple[msg.sender]++;
  }

  function sellMyApple(uint _applePrice)  payable external {
    uint refund = (myApple[msg.sender] * _applePrice);
    myApple[msg.sender] = 0;
    msg.sender.transfer(refund);
  }
}
