pragma solidity ^0.4.19;
/*
    함수선언은 javascript와 동일 실은 모든 프로그래밍언어는 대부분 비슷하다.

    함수선언 예약어만 다를뿐..

    ex) python def

    솔리디티 함수선언 예약어는 function 입니다.

    즉 

    function 함수명(){

    }

    형태는 같지만

    매개변수를 만들때 타입을 선언해야합니다

    ex ) javascript

    function sample(num1,num2){

    }

    ex ) solidity 

    function sample(uint num1, uint num2) {

    }



 */
contract ZombieFactory{

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function createZombie(string _name, uint _dna) {
        // 여기서 시작
    }

}

