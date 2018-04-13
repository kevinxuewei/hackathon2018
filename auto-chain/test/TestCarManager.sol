pragma solidity ^0.4.18;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CarManager.sol";
contract TestCarManager {
  CarManager carManager = CarManager(DeployedAddresses.CarManager());
  function test(){
    uint sum = carManager.test(1,2);
    Assert.equal(sum,3,"error");
  }


  function testSignUp(){
    bytes32 name = 'testName';
    bytes32 res = carManager.signup(name);
    Assert.equal(name,res,"error");
    bytes32 res2 = carManager.login();
    Assert.equal(name,res2,"error");
  }
}


