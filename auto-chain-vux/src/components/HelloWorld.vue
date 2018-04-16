<template>
  <div class="hello">
    <div style="text-align: center">{{userData || '数据载入中。。。'}}</div>
    <vue-highcharts :options="options" ref="lineCharts"></vue-highcharts>
    <pre style="text-align: left">{{options || '数据载入中。。。'}}</pre>
  </div>
</template>

<script>
import VueHighcharts from 'vue2-highcharts';
import { web3 } from 'wallet';

var abi = require('../../truffle/build/contracts/MatrixBasicData').abi;
const instanceMatrix = web3.loadContract(abi, process.env.MATRIX_ADDR);
abi = require('../../truffle/build/contracts/InsightUserData').abi;
const instanceUserData = web3.loadContract(abi, process.env.USER_ADDR);


const gender = {
  "0": "未知",
  "1": "男性",
  "2": "女性"
}

const age = {
  "0": "未知",
  "1": "0-17岁",
  "2": "18-21岁",
  "3": "22-24岁",
  "4": "25-29岁",
  "5": "30-34岁",
  "6": "35-39岁",
  "7": "40-49岁",
  "8": "50-80岁",
  "100": ">80岁"
}

export default {
  name: 'HelloWorld',

  async beforeMount() {
    const male = await instanceMatrix.countBy(['userGender'], [web3.fromUtf8('1')], false);
    const female = await instanceMatrix.countBy(['userGender'], [web3.fromUtf8('2')], false);

    this.$data.options = {
      chart: {
        type: 'pie'
      },
      title: {
        text: '性别'
      },
      tooltip: {
        pointFormat: '<b>{point.percentage:.1f}%</b>'
      },
      series: [{
        name: '性别',
        data: [{
          name: '男',
          y: male.toNumber()
        }, {
          name: '女',
          y: female.toNumber(),
        }]
      }]
    };

    const matrixAddr = await instanceUserData.matrixAddr();
    console.log('matrixAddr:' + matrixAddr);

    const result = await instanceUserData.analysis(web3.eth.defaultAccount, [web3.fromUtf8('userGender'), web3.fromUtf8('userAge')]);
    console.log('0x' + result.toString(16));

    const tmpGender = web3.toUtf8('0x' + (result << 24).toString(16));
    const tmpAge = web3.toUtf8('0x' + (result >> 8).toString(16));
    console.log('age:' + tmpAge + ', gender:' + tmpGender);
    this.$data.userData = '你的性别：' + (gender[tmpGender] || '未知') + ', 年龄：' + (age[tmpAge] || '未知');
  },

  data() {
    return {
      options: null,
      userData: null
    };
  },

  components: {
    VueHighcharts
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
