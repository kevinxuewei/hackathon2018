# hackathon-demo

> hackathon 2018 demo

## Build Setup

``` bash
# 安装依赖
npm install


# truffle 部署
truffle develop
truffle(develop)>migrate --reset
注意记录MatrixBasicData合约地址，InsightUserData合约地址

由于本地测试，MatrixBasicData合约部署后里面没有数据，需要手动注入测试数据，在truffle develop 命令行执行以下4个命令：

truffle(develop)>MatrixBasicData.deployed().then(function(contractInstance) {contractInstance.updateUserData('0x7ea3e5cc1ed7f59e9f0f309e68623f2b', [web3.fromUtf8('userGender')], [web3.fromUtf8('1')]).then(function(v) {console.log(v)})})

truffle(develop)>MatrixBasicData.deployed().then(function(contractInstance) {contractInstance.updateUserData('0x7ea3e5cc1ed7f59e9f0f309e68625f2c', [web3.fromUtf8('userGender')], [web3.fromUtf8('2')]).then(function(v) {console.log(v)})})

truffle(develop)>MatrixBasicData.deployed().then(function(contractInstance) {contractInstance.updateUserData('0x7ea3e5cc1ed7f59e9f0f309e68625f2c', [web3.fromUtf8('userAge')], [web3.fromUtf8('100')]).then(function(v) {console.log(v)})})

truffle(develop)>MatrixBasicData.deployed().then(function(contractInstance) {contractInstance.registerAddress('0x627306090abab3a6e1400e9345bc60c78a8bef57','0x7ea3e5cc1ed7f59e9f0f309e68625f2c').then(function(v) {console.log(v)})})

注意：其中最后命令的registerAddress()的第一个参数是truffle 的第一个默认账户地址(0x627306090abab3a6e1400e9345bc60c78a8bef57)，启动metamask连接本地http://localhost:9545后，也需要使用此账户

# 本地启动前端 localhost:8080
使用环境变量，指定合约地址：（注意调整metamask 连接合约所在环境，本地为http://localhost:9545，其中MATRIX_ADDR是MatrixBasicData合约地址，USER_ADDR是InsightUserData合约地址）
MATRIX_ADDR=0x345ca3e014aaf5dca488057592ee47305d9b3e10 USER_ADDR=0x8f0483125fcb9aaaefa9209d8e9d7b9c8b9fb90f npm run dev


# build 前端dist包
npm run build

# build for production and view the bundle analyzer report
npm run build --report


# 打包前端，提交（只供参考，不要上传此demo；如果定制，其中配置hackathon-demo\config\prod.env.js需要更新合约地址）
在hackathon-demo目录：
1. npm run build
2. 编辑 hackathon-demo\dist\index.html 文件，将绝对路径替换为相对路径（将所有'=/static' 替换为 '=static'）
3. zip dist.zip -r dist
4. 到比赛报名网站(http://hackathon2018.ad.xiaomi.com/team/index) 提交dist.zip，完成

```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
