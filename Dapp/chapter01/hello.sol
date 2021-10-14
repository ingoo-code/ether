pragma solidity ^0.8.0;

contract hello{
    string value;
    constructor(){
        value = "hello world!";
    }

    // 파일시스템 파일에 저장된 내용을 가져올거냐. storage
    // 메모리에 저장된 내용을 가져올거냐. memory
    function get() public view returns(string memory){
        return value;
    }

    // solcjs --bin --abi .\hello.sol
    // hello_sol_hello.abi
    // hello_sol_hello.bin
    //[파일명]_[확장자]_[컨트랙트명]
}

// react 투두리스트 

// 투표앱 << 