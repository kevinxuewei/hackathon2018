<template>
  <div>
    <div style="overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <card @click.native="$router.push('/collect/detailCollect')" style="cursor: pointer;margin-bottom:2%">
        <img slot="header" :src="require('../assets/images/' + i + '.jpg')"
             style="width:100%;display:block;">
        <div slot="content" class="card-padding" style="height: 40%">
            <cell :title="'车型'" :value="'别克凯越2016 1.6L'"></cell>
            <cell :title="'总价/代币'"><span>ETH 30/</span><countup :start-val="1" :end-val="15000" :duration="2.5"></countup></cell>
            <!--<cell :title="'数量'"></cell>-->
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
