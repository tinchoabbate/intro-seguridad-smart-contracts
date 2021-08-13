pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract VaultV3 is Ownable, ReentrancyGuard {

  using Address for address payable;

  mapping (address => uint256) public deposits;

  /**
    @notice Depositar ETH
   */
  function deposit() external payable {
    deposits[msg.sender] += msg.value;
  }

  /**
    @notice Retirar ETH depositado
   */
  function withdraw() external nonReentrant {
    uint256 amountDeposited = deposits[msg.sender];

    // La función `sendValue` está disponible porque estamos usando la libreria Address de OpenZeppelin Contracts
    // Más detalles sobre esta función en https://docs.openzeppelin.com/contracts/4.x/api/utils#Address-sendValue-address-payable-uint256-
    payable(msg.sender).sendValue(amountDeposited);

    deposits[msg.sender] = 0;
  }
}
