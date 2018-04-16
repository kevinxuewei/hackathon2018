const PrivateKeyProvider = require('truffle-privatekey-provider');
const provider = process.env.PRI && process.env.URL && new PrivateKeyProvider(process.env.PRI, process.env.URL);

module.exports = {
  networks: {
    testrpc: {
      host: "localhost",
      port: 9545,
      network_id: "*",
      gas: 4500000, // Gas limit used for deploys
      gasPrice: 10000000000 // 10 gwei
    },
    prod: {
      provider,
      network_id: '*',
      gas: 4500000, // Gas limit used for deploys
      gasPrice: 10000000000 // 10 gwei
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  // https://truffle.readthedocs.io/en/beta/advanced/configuration/
  mocha: {
    bail: true
  }
};
