<template>
  <div>
    <div style="margin: 10px;overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <card @click.native="$router.push('/collect/detailCollect')" style="cursor: pointer">
        <img slot="header" :src="'https://o5omsejde.qnssl.com/demo/test' + i + '.jpg'"
             style="width:100%;display:block;">
        <div slot="content" class="card-padding">
          <group>
            <cell :title="'车型'" :value="'别克凯越2016 1.6L'"></cell>
          </group>
          <group>
            <cell :title="'叫啥来着'" :value="'ETH 30 代币'"></cell>
          </group>
        </div>
      </card>
    </div>
  </div>
</template>

<script>
  import {Card, Group, Cell} from 'vux'

  export default {
    components: {
      Card,
      Group,
      Cell
    },
    data() {
      return {}
    }
  }
</script>

<style lang="less">
</style>
