// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

interface IFlashLoanPool {
    function flashLoan(uint256 amount) external;
    function deposit() external payable;
    function withdraw() external;
}

contract FlashLoanAttacker is Ownable {

    IFlashLoanPool private immutable pool;

    constructor(address poolAddress) {
        pool = IFlashLoanPool(poolAddress);
    }

    function attack() external onlyOwner {
        // COMPLETAR
        // ¿Cómo iniciamos el ataque?
        // ¿Tal vez por el flash loan? ¿Y luego?
    }

    function execute() external payable {
        // COMPLETAR
        // Si pedimos un flash loan, ¿qué hacemos con los ETH que llegan a esta función?
    }

    receive () external payable {}
}
