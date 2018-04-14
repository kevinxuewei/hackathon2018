pragma solidity ^0.4.18;

import './CarToken.sol';
import './CarCrowdsale.sol';

contract CarSaleManager {

  mapping (uint => address) owners;

  mapping (uint => CarCrowdsale) carSales;

  mapping (uint => CarToken) carTokens;

  function saleCar(uint32 carId, uint256 price) public {
    address carOwner = msg.sender;
    CarToken token = new CarToken();
    CarCrowdsale carSale = new CarCrowdsale(1, carOwner, price, token);
    owners[carId] = carOwner;
    carSales[carId] = carSale;
    carTokens[carId] = token;
  }
}
