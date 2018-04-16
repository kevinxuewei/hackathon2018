import contract from 'truffle-contract'
import UsersContract from '@contracts/Users.json'
import {web3} from 'wallet'

const Users = {

  contract: null,

  instance: null,

  init: function () {
    let self = this

    return new Promise(function (resolve, reject) {
      self.contract = contract(UsersContract)
      self.contract.setProvider(window.web3.currentProvider)

      // self.contract.deployed().then(instance => {
      //   self.instance = instance
      //   resolve()
      // }).catch(err => {
      //   reject(err)
      // })

      let abi = require('@contracts/CarManager.json').abi;
      try{
        self.instance = web3.loadContract(abi, process.env.CARMANAGER_ADDR)
        console.log("init miao!")
        console.log(self.instance)
        resolve()
      } catch(err){
        reject(err)
      }
    })
  },

  login: function () {
    let self = this

    return new Promise((resolve, reject) => {
      self.instance.login.call(
        {from: window.address}
      ).then(data => {
        resolve(window.web3.toUtf8(data))
      }).catch(err => {
        reject(err)
      })
    })
  },

  signup: function (name) {
    let self = this

    return new Promise((resolve, reject) => {
      self.instance.signup(
        window.web3.fromUtf8(name),
        {from: window.address}
      ).then(tx => {
        resolve(tx)
      }).catch(err => {
        reject(err)
      })
    })
  }

}

export default Users
