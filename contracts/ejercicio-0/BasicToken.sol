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
/// @dev ¡Cuidado! Este no es un token full ERC20. Por ejemplo, no implementa funciones de approval / transferFrom.
contract BasicToken is Mintable {

    // Para las variables de estado públicas, Solidity crea automáticamente getters
    uint256 public totalSupply;

    // Registro interno de balances por cuenta
    mapping(address => uint256) private _balances;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor(
        uint256 _initialSupply
    ) {
        totalSupply = _initialSupply;

        // La cuenta que deploye el contrato va a tener poder para generar nuevos tokens
        minter = msg.sender;
        
        // El supply inicial se asigna a la cuenta que deploye el contrato
        _balances[msg.sender] = _initialSupply;
    }

    // Función para consultar el balance de una cuenta
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    // Función para transferir tokens
    function transfer(address to, uint256 amount) external returns (bool) {
        _balances[msg.sender] -= amount;
        _balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // Función para crear tokens. Sólo llamable por una cuenta con privilegios.
    function mint(address to, uint256 amount) external onlyMinter returns (bool) {
        _balances[to] += amount;
        emit Transfer(address(0), to, amount);
        return true;
    }
}
