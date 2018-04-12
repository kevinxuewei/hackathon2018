<template>
  <div>
    <group :title="'费用单位为 代币/小时'">
      <popup-picker title="车辆选择" :data="list" value-text-align="left"></popup-picker>
      <x-input title="基础费用："></x-input>
      <x-input title="忙时费用："></x-input>
      <x-input title="预计时长："></x-input>
    </group>
    <box gap="20px 20px">
      <x-button :gradients="['#1D62F0', '#19D5FD']">提交</x-button>
    </box>
  </div>
</template>

<script>
import {Box, XButton, XInput, Group, PopupPicker} from 'vux'

export default {
  components: {
    PopupPicker,
    Box,
    XButton,
    XInput,
    Group
  },
  data() {
    return {
      list: [['别克凯越', '丰田凯美瑞', '摩拜']]
    }
  }
}
</script>

<style less>
</style>
