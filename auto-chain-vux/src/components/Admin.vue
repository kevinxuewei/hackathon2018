<template>
  <div>
    <div class="left">
      <input size="50" type="text" placeholder="地址" v-model="addr"/>
      <button v-on:click="addAdmin">添加馆里猿</button>
    </div>

    <br/>

    <table>
      <thead>
        <tr><th>地址</th><th>角色</th></tr>
      </thead>
      <tbody>
        <tr v-for="addr of addresses">
          <td>{{addr.addr}}</td>
          <td>{{addr.roleName}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { web3 } from 'wallet';

const abi = require('../abi/MatrixBasicData');
const instance = web3.loadContract(abi, process.env.MATRIX_ADDR);

const events = [];
instance
  .RoleAdded({}, { fromBlock: 0, toBlock: 'latest' })
  .watch((err, ev) => {
    if (!err) {
      const { addr, roleName } = ev.args;
      events.push({ addr, roleName });
    }
  });

export default {
  name: 'Admin',

  methods: {
    addAdmin() {
      const addr = this.$data.addr;
      if (addr.match(/^0x[0-9a-f]+$/i)) {
        instance.adminAddRole(addr, 'admin');
      } else {
        alert('清输入合法地址');
      }
    }
  },

  data() {
    return {
      addr: '',
      addresses: events
    };
  }
}
</script>

<style scoped lang="scss">
.left {
  text-align: left;
}

table {
  th, td {
    padding: 5px;
    font-family: monospace;
  }
}
</style>
