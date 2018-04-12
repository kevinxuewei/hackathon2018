<template>
  <div>
    <div style="margin: 10px;overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <v-card :imgSrc="'https://o5omsejde.qnssl.com/demo/test' + i + '.jpg'" style="margin-bottom:5%;display:block;"></v-card>
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
