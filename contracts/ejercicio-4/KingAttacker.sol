// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract KingAttacker is Ownable {

    function attack(address payable kingContractAddress) external payable onlyOwner {
        // COMPLETAR
        // ¿Qué función del contrato King tenemos que llamar?
        // ¿Hay que enviar ETH? ¿Cuánto?
        // ¿Qué función conviene usar en este caso para enviar ETH? ¿Qué librería usamos?
    }
}
