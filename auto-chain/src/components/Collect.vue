<template>
  <div>
    <img slot="header" :src="'https://o5omsejde.qnssl.com/demo/test1.jpg'"
         style="width:100%;height:60%;display:block;">
    <div slot="content" class="card-padding">
      <group>
        <cell :title="'车辆名称'" :value="'别克凯越2016 1.6L'"></cell>
        <cell-form-preview :list="list1"></cell-form-preview>
      </group>
      <group>
        <box gap="20px 20px">
          <x-button :gradients="['#1D62F0', '#19D5FD']">发起募集</x-button>
        </box>
      </group>
    </div>
  </div>
</template>

<script>
import { Box, XButton,CellFormPreview, Group, Cell } from 'vux'

export default {
  components: {
    Box,
    XButton,
    CellFormPreview,
    Group,
    Cell
  },
  data () {
    return {
      list1: [{
        label: '总金额',
        value: '30ETH'
      }, {
        label: '发型代币',
        value: '150,000'
      }, {
        label: '车主位置',
        value: '清河'
      }, {
        label: '母鸡进度',
        value: '100,000 / 150,000'
      }]
    }
  }
}
</script>

<style less>
</style>
