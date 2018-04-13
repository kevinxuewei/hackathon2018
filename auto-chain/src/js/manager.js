import contract from 'truffle-contract'
import CarsContract from '@contracts/CarManager.json'

const CarManager = {

  contract: null,

  instance: null,

  init: function () {
    let self = this

    return new Promise(function (resolve, reject) {
      self.contract = contract(CarsContract)
      self.contract.setProvider(window.web3.currentProvider)
      self.contract.deployed().then(instance => {
        self.instance = instance
        resolve()
      }).catch(err => {
        reject(err)
      })
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
        name,
        {from: window.address}
      ).then(data => {
        resolve(window.web3.toUtf8(data))
      }).catch(err => {
        reject(err)
      })
    })
  },

  
}

export default CarManager
