<template>
  <card @on-click-header="test">
    <img slot="header" :src="imgSrc"
         style="width:100%;height:60%;display:block;">
    <div slot="content" class="card-padding" style="height: 40%">
      <p style="color:#999;font-size:18px;">车型</p>
      <p style="font-size:24px;line-height:1.2;">
        别克凯越2016 1.6L</p>
      <p style="color:#999;font-size:18px;">叫啥来着</p>
      <p style="font-size:24px;line-height:1.2;">
        ETH 30 代币  <countup :start-val="1" :end-val="15000" :duration="200"></countup></p>
    </div>
  </card>
</template>

<script>
import { Card, Countup } from 'vux'
export default {
  props: ['imgSrc'],
  components: {
    Card,
    Countup
  },
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  methods: {
    test () {}
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
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
