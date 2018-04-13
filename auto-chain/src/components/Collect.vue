<template>
  <div>
    <img slot="header" :src="'https://o5omsejde.qnssl.com/demo/test1.jpg'"
         style="width:100%;height:60%;display:block;">
    <div slot="content" class="card-padding">
      <group :title="'费用单位为 代币/小时'">
        <x-input title="车辆名称："></x-input>
        <x-input title="总金额："></x-input>
        <x-input title="发行代币："></x-input>
        <x-input title="车主位置："></x-input>
        <x-input title="基础费用："></x-input>
        <x-input title="忙时费用："></x-input>
      </group>
      <box gap="20px 20px">
        <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="$router.push('/success')">发起募集</x-button>
      </box>
    </div>
  </div>
</template>

<script>
import { Box, XButton, Group, XInput } from 'vux'

export default {
  components: {
    Box,
    XButton,
    XInput,
    Group
  }
}
</script>

<style less>
</style>
