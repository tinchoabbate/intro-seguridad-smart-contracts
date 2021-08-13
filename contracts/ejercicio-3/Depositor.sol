pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IVaultV2 {
    function deposit() external payable;
    function withdraw() external;
}

contract Depositor is Ownable {

    IVaultV2 public immutable vault;

    constructor(address vaultContractAddress) {
        vault = IVaultV2(vaultContractAddress);
    }

    function depositToVault() external payable onlyOwner {
        // COMPLETAR
        // La sintaxis para enviar ETH de un contrato a otro podés verla acá https://docs.soliditylang.org/en/v0.8.7/control-structures.html#external-function-calls
    }

    function withdrawFromVault() external onlyOwner {
        // COMPLETAR
    }

    // 1. ¿Por qué es necesaria esta función?
    // 2. ¿Qué pasa si la borramos?
    // 3. Aún así, ¿es suficiente? ¿No necesitamos lógica adicional?
    // 4. De ser necesaria, ¿podemos incluir esa lógica acá?
    receive() external payable {}
}
