var Ownable = artifacts.require('zeppelin-solidity/contracts/ownership/Ownable.sol')
var Destructible = artifacts.require('zeppelin-solidity/contracts/lifecycle/Destructible.sol')
var Authentication = artifacts.require('./Users.sol')

module.exports = function (deployer) {
  deployer.deploy(Ownable)
  deployer.link(Ownable, Destructible)
  deployer.deploy(Destructible)
  deployer.link(Destructible, Authentication)
  deployer.deploy(Authentication)
}
