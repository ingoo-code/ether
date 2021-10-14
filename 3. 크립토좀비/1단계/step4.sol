pragma solidity ^0.4.19;

// 구조체 
/*
    사실 별거없다. 자바스크립트 객체라 생각하자 형태가 매우 비슷한다.
    비슷할뿐 똑같지않다.

    타입이있는 언어들은 대부분 선언후 사용하는것이 대부분 코딩방법이다.

    내가앞으로 int값으로 age값 받고 string 값으로 name을 받을거야. 라는 선언이라 보면된다.
    
*/
contract ZombieFactory{
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }
}