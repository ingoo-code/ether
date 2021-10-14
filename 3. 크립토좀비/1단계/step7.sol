pragma solidity ^0.4.19;
/*
    배열에 추가하기 

    이것은.. 자바스크립트 .push 와 동일하므로 사용법으로 보여드릴게요
    자바스크립트와 동일합니다.
 */
contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function createZombie(string _name, uint _dna) {
        zombies.push(Zombie(_name, _dna));
    }
}