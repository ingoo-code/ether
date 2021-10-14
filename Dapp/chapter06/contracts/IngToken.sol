// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract MagToken is ERC20 {
    uint public INITIAL_SUPPLY = 21000000;

    constructor() public ERC20("ingoo TOKEN", "ING") {
        _mint(msg.sender, INITIAL_SUPPLY * 10 ** (uint(decimals())));
    }
}
