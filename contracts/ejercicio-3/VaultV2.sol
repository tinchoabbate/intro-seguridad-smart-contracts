pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VaultV2 is Ownable {

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
  function withdraw() external {
    uint256 amountDeposited = deposits[msg.sender];
    
    // Acá se está usando la función de `transfer` para enviar ETH.
    // Esta es una función nativa de Solidity (https://docs.soliditylang.org/en/v0.8.7/units-and-global-variables.html#members-of-address-types)
    // NO confundir con función `transfer` de la especificación ERC20 (https://eips.ethereum.org/EIPS/eip-20#transfer)
    payable(msg.sender).transfer(amountDeposited);
    
    deposits[msg.sender] = 0;
  }
}
