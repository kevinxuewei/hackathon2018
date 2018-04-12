<template>
  <div>
    <group :title="'费用单位为 代币/小时'">
      <x-input title="基础费用："></x-input>
      <x-input title="忙时费用："></x-input>
    </group>
    <box gap="20px 20px">
      <x-button :gradients="['#1D62F0', '#19D5FD']">提交</x-button>
    </box>
  </div>
</template>

<script>
import {Box, XButton, XInput, Group} from 'vux'

export default {
  components: {
    Box,
    XButton,
    XInput,
    Group
  },
  data() {
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
