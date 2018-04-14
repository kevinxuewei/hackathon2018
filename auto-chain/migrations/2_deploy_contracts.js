
var users = artifacts.require("Users");
var carSaleManager = artifacts.require("CarSaleManager");
module.exports = function(deployer) {
  deployer.deploy(users);
  deployer.deploy(carSaleManager);
};
