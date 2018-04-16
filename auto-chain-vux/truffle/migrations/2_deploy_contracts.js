const MatrixBasicData = artifacts.require('MatrixBasicData');
const InsightUserData = artifacts.require('InsightUserData');

module.exports = async function (deployer) {
  await deployer.deploy(MatrixBasicData);
  const matrix = await MatrixBasicData.deployed();

  await deployer.deploy(InsightUserData, matrix.address);
  //await deployer.deploy(InsightUserData, '0x601216c48a9a24121511788fbe85e8f9cb6662a9'); //部署 prod 环境
};
