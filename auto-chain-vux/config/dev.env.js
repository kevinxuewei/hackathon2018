'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  MATRIX_ADDR: `"${process.env.MATRIX_ADDR || '0x601216c48a9a24121511788fbe85e8f9cb6662a9'}"`,
  USER_ADDR: `"${process.env.USER_ADDR || '0xe57d948f1db4ee0a415dfef52259c1a33c1cd924'}"`
})
