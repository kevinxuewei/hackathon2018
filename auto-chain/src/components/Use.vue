<template>
  <div style="position:fixed;width:100%;display:block;">
    <group :title="'费用单位为 代币/小时'">
      <popup-picker title="车辆选择" :data="list" value-text-align="left"></popup-picker>
      <x-input title="基础费用："></x-input>
      <x-input title="忙时费用："></x-input>
      <x-input title="预计时长："></x-input>
    </group>
    <box gap="20px 20px">
      <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="$router.push('/success')">提交</x-button>
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
  data () {
    return{
      list: [['雪佛兰', '别克', 'ofo']]
    }
  }
}
</script>

<style less>
</style>
