# solidity 
- Metamask 와 testnet을 활용하는 스마트컨트랙트 배포
- ERC20 토큰 개발
- Solidity 개발 환경 및 디버깅 방법
- Solidity 문법

## Smart Contract

- 이더리움에서 스마트 컨트렉트는 이더리움의 상태를 변경 할수 있는
프로그램 코드로서 블록에 포함되어 각 노드에 전파되고, EVM 에서 작동되어
상태전이를 발생
- 사용자 어카운트(EOA)에 의해서 발생한 트랜잭션이나 다른 컨트랙트에 의해서만 실행
- 스마트 컨트랙트간의 호출은 메시지라는 특별한 구조체를 사용하여 호출

## 스마트 컨트랙트의 실행과정

- 솔리디티 코드를 작성하면 solc 활용하여 컴파일을 진행하고, 결과물은 바이트코드와 ABI파일이 생성되며, EVM이 이두파일을 읽어서 해당블록에
내용을 넣어놓는 행위가 컨트랙트 배포 or 실행입니다.

### EVM이란 

- 비휘발성 (non-volatile) 
storage : 상태(state)가 저장
code : 스마트 컨트랙트의 컴파일된 바이트 코드가 저장

- 휘발성 (volatile)
stack : OP 코드를 실행하기위한 스택영역
args : 컨트랙트 호출시 넘어오는 인자를 저장
memory : word 단위로 아이템을 저장하는 바이트배열

### EVM 특징

- 임시저장소와 영구저장소를 구분하여, 임시저장소에 저장한 값은 해당 인스턴스에서만 유효하고, 영구저장소에 저장한 값은 해당 컨트랙트 전체에 유효
- EVM에서 바이트 코드를 시랳앟기 위해서 다음의 3가지 요소가 필요
- 컨테이너에 값을 Push, Pop하기 위한 스택
- 바이트 배열을 담을수 있는 배열
- 영속적으로 값을 저장하기 위한 저장소. 현재 저장소로는 레벨DB를 사용

4,8 바이트 워드단위는 크기가 너무작아 32바이트 워드 단위를 지원
32바이트 워드크기등 이더리움에서 요구하는 VM기능과 명세를 지원하기 위해 단순화된 자체 VM을 개발

메모르키각 가변적이고 스택의 크기에 제한이 없음
반복호출횟수를 1024로 제한

### EVM OP코드

- OPCODE 분류표
0s: Stop and Arithmetic Operations
10s: Comparison & Bitwise Logic Operations
20s: SHA3
30s: Environmental Infomation
40s: Block Information
50s: Stack,Memory,Storage and Flow Operations
60s&70s: Push Operations
80s: Duplication Operations
90s: Exchange Operations
a0s: logging Operations

### OPCODE표

value   Mnemonic    Gas Used
0x00    STOP        0
0x01    ADD         3
0x02    MUL         5
0x03    SUB         3
0x04    DIV         5
0x05    SDIV        5
0x06    MOD         5
0x07    SMOD        5
0x08    ADDMOD      8
0x09    MULMOD      8

### EVM OP코드와 동작원리

evm --deubg --code 6001000201 run
*evm 실행을 어떻게해야하는걸까? 알아보자.*


### 첫 간단한 토큰 만들기

```
pragma solidity ^0.4.16;

contract MinimumViableToken {
    mapping(address => uint256) public balanceOf;
    
    constructor() public {}
    
    function MinimumViableTokens(uint256 initialSupply) public {
        balanceOf[msg.sender] = initialSupply;
    }
    
    function transfer(address _to, uint256 _value) public {
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    } 
}
```






