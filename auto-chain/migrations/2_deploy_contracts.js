
var carManager = artifacts.require("CarManager");
module.exports = function(deployer) {
  deployer.deploy(carManager);
};
