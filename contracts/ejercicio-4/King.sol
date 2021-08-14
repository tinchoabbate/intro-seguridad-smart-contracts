// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * Adaptado del desafio "King" de https://ethernaut.openzeppelin.com
 */
contract King {

  address payable public king;
  uint256 public prize;

  constructor() payable {
    king = payable(msg.sender);
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value > prize, "No es suficiente ETH para convertirse en rey");
    king.transfer(msg.value);
    king = payable(msg.sender);
    prize = msg.value;
  }
}
