// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mintable {
    address public minter;

    modifier onlyMinter() {
        require(msg.sender == minter, "No permitido");
        _;
    }

    constructor() {
        minter = msg.sender;
    }
}

/// @title BasicToken
/// @notice Implementación básica y muy simplificada de un token minteable.
/// @dev ¡Cuidado! Este no es un token full ERC20.
contract BasicToken is Mintable {

    // Para las variables de estado públicas, Solidity crea automáticamente getters
    uint256 public totalSupply;

    // Registro interno de balances por cuenta
    mapping(address => uint256) private balances;

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
    }

    // Función para consultar el balance de una cuenta
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    // Función para transferir tokens
    function transfer(address to, uint256 amount) external {
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    // Función para crear tokens. Sólo llamable por una cuenta con privilegios.
    function mint(address to, uint256 amount) external onlyMinter {
        balances[to] += amount;
    }
}
