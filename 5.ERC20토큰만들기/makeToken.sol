// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC20 {
    // ... 현재까지 공급된 토큰 수 
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function totalSupply() external view returns(uint256);
    
    // _owner가 보유한 토큰 잔액을 반환
    function balanceOf(address _owner) external view returns(uint256 balance);
    
    // 수신자 (_to) 로 해당금액(_value)를 송금. 송금이 성공하면 true 반환 , 실패하면 false
    function transfer(address _to, uint256 _value) external returns (bool);
    
    
    //송신자(_from)주소에서 수신자(_to) 주소로 해당금액(_value)을 송금. 송금이 성공하면 TRUE를 반환하고, 실패하면 FALSE를 반환.       
    // transferFrom이 성공하려면 먼저 approve 인터페이스를 사용하여 일정금액을 인출할수 있도록 허락하여야 함.
    function transferFrom(address _from, address _to, uint256 _value) external returns(bool);

    // 송신자(msg.sender)가 보유한 토큰에서 일정금액(_value)만큼의 토큰을 인출할수 있는 권한을 수신자(_spender)에게 부여.
    function approve(address _spender, uint256 _value) external returns(bool);
    
    // 토큰 소유자 (_owner)가 토큰 수신자 (_spender)에게 인출을 허락 한 토큰이 얼마인지를 반환
    function allowance(address _owner, address _spender) external view returns(uint256);
}

contract StandardToken is ERC20 {
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;

    function transfer(address _to, uint _value) public returns (bool success){
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        if (balances[msg.sender] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns(uint256 remaining) {
        return allowed[_owner][_spender];
    }
}

contract IngToken is StandardToken {
    string public name; // 토큰이름
    uint8 public decimals;  // 표시할 소수점 자릿수
    string public symbol; // 단위이름 EX 이더리움 = ETH
    string public version = "1.0"; // 
    uint256 public unitsOneEthCanBuy; // 1ETH로 살수있는 토큰의 양
    uint256 public totalEthInWei; // ETH 저장공간 1ETH에 바꿀수있는 `uintsOneEthCanBuy` 만큼 토큰으로 교환해주는데 이후 ETH 저장하는 공간
    address public fundsWallet; //  소유자의 ETH 공간
    
    constructor() payable public {
        balances[msg.sender] = 1000000000000000000000;               // Give the creator all initial tokens. This is set to 1000 for example. If you want your initial tokens to be X and your decimal is 5, set this value to X * 100000. (CHANGE THIS)
        totalSupply = 1000000000000000000000;                        // Update total supply (1000 for example) (CHANGE THIS)
        name = "ingToken";                                   // Set the name for display purposes (CHANGE THIS)
        decimals = 18;                                               // Amount of decimals for display purposes (CHANGE THIS)
        symbol = "ING";                                             // Set the symbol for display purposes (CHANGE THIS)
        unitsOneEthCanBuy = 10;                                      // Set the price of your token for the ICO (CHANGE THIS)
        fundsWallet = msg.sender;                                    // The owner of the contract gets ETH  
    }
    
    fallback() external payable {
        totalEthInWei = totalEthInWei + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        require(balances[fundsWallet] >= amount); // require는 특정 조건이 참이 아닐 때 함수가 에러 메시지를 발생하고 실행을 멈추게 된다.

        balances[fundsWallet] = balances[fundsWallet] - amount;
        balances[msg.sender] = balances[msg.sender] + amount;

        emit Transfer(fundsWallet, msg.sender, amount);

        payable(fundsWallet).transfer(msg.value);
    }

    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        // Approval(msg.sender, _spender, _value);

        // if(!_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { require(false); }
        
        // if(!_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { return false; }
        
        // "receiveApproval(address,uint256,address,bytes)"
        // bytes32(
        
        /*
            bytes4는 receiveApproval(address,uint256,address,bytes)에 대한 32비트 Solidity 함수 서명입니다.

            이것은 대상 주소에서 함수 receiveApproval()을 호출합니다. 대상 주소에 이 기능이 없으면 조건이 트랜잭션 실패를 보장합니다. - 이 승인앤콜은 일반 이더리움 계정이나 호환되지 않는 스마트 계약이 아닌 receiveApproval() 인터페이스가 있는 계약만 호출할 수 있습니다.
            
            extraData는 이 호출에 대한 컨텍스트 정보를 대상 계약에 전달할 수 있습니다.
        */
        
        (bool success, bytes memory data) = _spender.call(abi.encodeWithSignature("receiveApproval(address,uint256,address,bytes)",
                                      msg.sender, _value, address(this), _extraData));
        require(success, "Call failed");
        return true;
    }
}

/* 가시성 */
//https://candykick.kr/solidity/
//fallback function 


/*
    contract MyContract {

    fallback() external payable {
        // custom function code
    }

    receive() external payable {
        // custom function code
    }
}

https://docs.soliditylang.org/en/v0.8.4/050-breaking-changes.html#semantic-and-syntactic-changes
*/