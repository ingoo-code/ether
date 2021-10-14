# Setting

nodejs 환경에서 셋팅 가능합니다.

Truffle 
Ganashe 

1. npm install -g truffle
2. npm install -g ganache-cli
3. npm install web3 

## web3 란 무엇인가? 

- RPC통신을 쉽게 구현할수있게 도와주는 라이브러리입니다.

```
ex ) 알트코인 rpc통신을 할려면 
express 를 설치하고
request 를 설치를해서 
request에다가 rpc통신을했던 내용들을 넣어줘서 
응답을 받아서 처리를했죠
```

server 내용...
client react, next , html 페이지에서 rpc통신을 한다고했을때.


### npm install -g ganache-cli

web 설치는
npm init 하시고
npm install web3 

truffle version
ganache-cli --host 0.0.0.0

# 가스 (gas)

이더리움 스마트 컨트랙트를 배포하고 실행할때. 사용되는 수수료 
hello 라는 글자를 0x7FE1d66b97cB4F8834293A231dC664a105f338B2
주소값에 보내겠다. 라고해도 수수료를 지불해야합니다.

block {
    block header{
        nonce
        merkleroot
        priviouseHash
        ...
    }.
    block body{
        data:[]
    }
}

# 가스 가격 (gas price)

스마트 컨트랙트를 발생할때 이것을 작성한 설정하는 가스가격입니다.


# 가스 한도 (gas limit)

1200만원 수수료가 1.5이더 한도 
최대 수수료는 이정도까지.


가나쉬 데몬이니깐 RPC통신을 통해서 
특정주소의 있는 이더리움의 갯수를 구할수있습니다.

0.0.0.0:8545 eth_getBalacne 
100ETH 나올수있겠금 RPC통신...

curl "쉘" 스크립트 // Linux 에서 사용가능하다..

1. eth_accounts 
2. eth_getBalance [주소값]

curl -X POST -d '{"jsonrpc":"2.0","method":"eth_accounts"}' http://127.0.0.1:8545

curl -X POST -d 
'{
    "jsonrpc":"2.0",
    "method":"eth_getBalance",
    "params":["0x7FE1d66b97cB4F8834293A231dC664a105f338B2"]
}' 
http://127.0.0.1:8545

{"jsonrpc":"2.0","result":"0x56bc75e2d63100000"}

100,000,000,000,000,000,000 wei = 100ETH

1ETH = 10^18wei 

1ETH = 1,000,000,000,000,000,000
0.000000000000000001 ETH = 1wei

wei 단위 

rpc통신을 curl 을 하지않고. 

web3 라이브러리 통해서 
javascript 코드를 작성해서 결과물을 받도록 해봅시다.

web3라이브러리가 설치되어있어야합니다.