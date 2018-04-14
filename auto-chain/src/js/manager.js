import contract from 'truffle-contract'
import CarsContract from '@contracts/CarManager.json'
import CarSaleManager from '@contracts/CarSaleManager.json'

const CarManager = {

  contract: null,

  instance: null,

  contract_carsales: null,

  carsales: null,

  carId: 1,

  init: function () {
    let self = this

    return new Promise(function (resolve, reject) {
      self.initUsers()
        .then(self.initCarSales())
        .then(resolve())
        .catch(err => {reject(err)})
    })
  },

  initUsers: function () {
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

  initCarSales: function () {
    let self = this

    return new Promise(function (resolve, reject) {
      self.contract_carsales = contract(CarSaleManager)
      self.contract_carsales.setProvider(window.web3.currentProvider)
      self.contract_carsales.deployed().then(instance => {
        self.carsales = instance
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
        window.web3.fromUtf8(name),
        {from: window.address}
      ).then(tx => {
        resolve(tx)
      }).catch(err => {
        reject(err)
      })
    })
  },

  raisingNewCar: function (carName, desc, price, amount, imgs, soldAmount) {
    let self = this

    return new Promise((resolve, reject) => {
      self.carsales.saleCar(
        self.carId++,
        price,
        {from: window.address}
      ).then(data => {
        resolve(data)
      }).catch(err => {
        reject(err)
      })
    })

  },

  buyNewCar: function (_cardId, amount) {
    // let self = this
    //
    // return new Promise((resolve, reject) => {
    //   self.instance.buyNewCar(
    //     _cardId,
    //     amount,
    //     {from: window.address}
    //   ).then(data => {
    //     resolve(data)
    //   }).catch(err => {
    //     reject(err)
    //   })
    // })

  },

  getUserDetail: function () {
    // let self = this
    //
    // return new Promise((resolve, reject) => {
    //   self.instance.getUserDetail.call(
    //     {from: window.address}
    //   ).then(data => {
    //     resolve(data)
    //   }).catch(err => {
    //     reject(err)
    //   })
    // })
  },

  getRaisingCardList: function () {
    // let self = this
    //
    // return new Promise((resolve, reject) => {
    //   self.instance.getRaisingCardList.call(
    //     {from: window.address}
    //   ).then(data => {
    //     resolve(data)
    //   }).catch(err => {
    //     reject(err)
    //   })
    // })
    //
  }

}


export default CarManager
