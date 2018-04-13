<template>
  <div>
    <div style="overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <card @click.native="$router.push('/detailMe')" style="margin-bottom: 2%;cursor: pointer">
        <img slot="header" :src="require('../assets/images/' + i + '.jpg')"
             style="width:100%;display:block;">
        <div slot="content" class="card-padding">
          <cell :title="'车型'" :value="'别克凯越2016 1.6L'"></cell>
          <cell :title="'状态'" :value="'使用中'"></cell>
          <cell :title="'数量'">
            <countup :start-val="1" :end-val="152310" :duration="2.5"></countup>
            <span>/</span>
            <countup :start-val="1" :end-val="15000" :duration="2"></countup>
          </cell>
          <cell :title="'占比'" :value="'14.56%'"></cell>
        </div>
      </card>
    </div>
  </div>
</template>

<script>
import {Card, Cell, Countup} from 'vux'

export default {
  components: {
    Card,
    Cell,
    Countup
  },
  data () {
    return {}
  }
}
</script>

<style lang="less">
</style>
