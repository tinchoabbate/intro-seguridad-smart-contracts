// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IVaultV3 {
    function deposit() external payable;
    function withdraw() external;
}

contract VaultV3Attacker is Ownable {

    IVaultV3 public immutable vault;

    constructor(address vaultContractAddress) {
        vault = IVaultV3(vaultContractAddress);
    }

    function attack() external payable onlyOwner {
        // COMPLETAR
    }

    receive() external payable {
        // COMPLETAR
    }
}
