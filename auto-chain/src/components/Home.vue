<template>
  <div>
    <div style="margin: 10px;overflow: hidden;" :key="i" v-for="i in [1,2,3,4,5]">
      <v-card :imgSrc="'https://o5omsejde.qnssl.com/demo/test' + i + '.jpg'" style="width:80%;margin: auto;margin-bottom:5%;display:block;"></v-card>
    </div>
  </div>
</template>

<script>
import { Masker } from 'vux'
import VCard from './CarCard.vue'

export default {
  components: {
    VCard,
    Masker
  },
  data () {
    return {
    }
  }
}
</script>

<style lang="less">
.m-img {
  padding-bottom: 33%;
  display: block;
  position: relative;
  max-width: 100%;
  background-size: cover;
  background-position: center center;
  cursor: pointer;
  border-radius: 2px;
}

.m-title {
  color: #fff;
  text-align: center;
  text-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
  font-weight: 500;
  font-size: 16px;
  position: absolute;
  left: 0;
  right: 0;
  width: 100%;
  text-align: center;
  top: 50%;
  transform: translateY(-50%);
}

.m-time {
  font-size: 12px;
  padding-top: 4px;
  border-top: 1px solid #f0f0f0;
  display: inline-block;
  margin-top: 5px;
}
</style>
