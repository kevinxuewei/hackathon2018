
var carMgr = artifacts.require("CarManager");
var carSaleManager = artifacts.require("CarSaleManager");
module.exports = function(deployer) {
  deployer.deploy(carMgr);
  deployer.deploy(carSaleManager);
};
