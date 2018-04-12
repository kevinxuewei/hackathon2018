<template>
  <div>
    <div style="margin: 10px;overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <img slot="header" :src="'https://o5omsejde.qnssl.com/demo/test' + i + '.jpg'"
           style="width:100%;height:60%;display:block;">
      <div slot="content" class="card-padding">
        <group>
          <cell :title="'车型'" :value="'别克凯越2016 1.6L'"></cell>
        </group>
        <group>
          <cell :title="'叫啥来着'" :value="'ETH 30 代币'"></cell>
        </group>
      </div>
      <!--<div slot="content" class="card-padding" style="height: 40%">-->
        <!--<p style="color:#999;font-size:18px;">车型</p>-->
        <!--<p style="font-size:24px;line-height:1.2;">-->
          <!--别克凯越2016 1.6L</p>-->
        <!--<p style="color:#999;font-size:18px;;">叫啥来着</p>-->
        <!--<p style="font-size:24px;line-height:1.2;">-->
          <!--ETH 30 代币-->
          <!--<countup :start-val="1" :end-val="15000" :duration="300"></countup>-->
        <!--</p>-->
      <!--</div>-->
    </div>
  </div>
</template>

<script>
import VCard from './CarCard.vue'

export default {
  components: {
    VCard
  },
  data () {
    return {
    }
  }
}
</script>

<style lang="less">
</style>
