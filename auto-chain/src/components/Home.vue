<template>
  <div>
    <div style="margin: 10px;overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <card @click.native="$router.push('/collect/detailCollect')" style="cursor: pointer;margin-bottom:7%">
        <img slot="header" :src="'https://o5omsejde.qnssl.com/demo/test' + i + '.jpg'"
             style="width:100%;height:60%;display:block;">
        <div slot="content" class="card-padding" style="height: 40%">
            <cell :title="'车型'" :value="'别克凯越2016 1.6L'"></cell>
            <cell :title="'代币类型'" :value="'Eth 30'"></cell>
            <cell :title="'数量'"><countup :start-val="1" :end-val="15000" :duration="2.5"></countup></cell>
        </div>
      </card>
    </div>
  </div>
</template>

<script>
import { Card, Countup, AlertModule, Cell } from 'vux'

export default {
  components: {
    Cell,
    Card,
    Countup,
    AlertModule
  }
}
</script>

<style lang="less">
</style>
