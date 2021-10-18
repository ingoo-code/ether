// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/*
  1. 보낸 사람의 계정(주소)에서 사과를 총몇개 가지고있는가,
  2. 사과를 구매했을시, 해당 계정(주소)에 사과 추가해줍니다.
  3. 사과를 판매시 내가 가지고있는 사과*사과구매가격 만큼 토큰을 반환해주고,
     사과를 0개로 바꿔줍시다.
  4. 내사과를 반환해주는 함수를 만들기. 
 */
contract Fruitshop {
  mapping(address=>uint) myApple;
  constructor() public {
  }

  function buyApple() payable external {
    //msg.sender
    myApple[msg.sender]++;
  }

  function getMyApple() public view returns(uint){
    return myApple[msg.sender];
  }

  function sellApple(uint _applePrice) payable external {
    uint totalPrice = (myApple[msg.sender] * _applePrice); // 내가가진 사과 * 개당 사과값 
    myApple[msg.sender] = 0; // 내가 보낸 주소의 myapple 수를 0으로 초기화 
    msg.sender.transfer(totalPrice);
  }
}



