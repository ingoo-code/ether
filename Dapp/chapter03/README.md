# 메타마스크에 가나슈 연결하기


# 트러플로 개발환경 구축하기

```
truffle unbox react
```

### 기본 기능

Compile : truffle compile
Migrate : truffle  migrate
Test contract : truffle test
Test dapp : cd client && npm test
dev server : cd client && npm run dev
build for production : cd client && npm run build

### 설치이후 truffle-config.js 수정하기

```
const path = require("path");

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    development:{
      host:"127.0.0.1",
      port:7545,
      network_id:"*"
    },
    develop: {
      port: 8545
    }
  }
};
```
truffle complie
truffle migrate
truffle test


simplteStorage.sol 삭제
```
truffle create contract Fruitshop
```