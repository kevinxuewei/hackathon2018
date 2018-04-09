# hackathon2018
Mi block chain hackathon

# 环境配置

install nvm
```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
```
set nvm path
```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

nvm install node 
```sh
nvm i 8
```

npm set taobao registry
```sh
npm config set registry https://registry.npm.taobao.org
```

install truffle
```sh
npm install -g truffle
```

truffle contract compile
```sh
truffle compile
```

truffle contract migrate(install)
```sh
truffle migrate
```

start web
```sh
npm run start
```
