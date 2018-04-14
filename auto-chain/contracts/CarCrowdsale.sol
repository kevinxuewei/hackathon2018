pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import 'zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol';
import './CarToken.sol';

contract CarCrowdsale is CappedCrowdsale {

  function CarCrowdsale(uint256 _rate, address _wallet, uint256 _cap, CarToken _token) public
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
  {

  }
}
