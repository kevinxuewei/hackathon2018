<template>
  <div style="position:fixed;width:100%;display:block;">
    <group :title="'费用单位为 代币/小时'">
      <x-input title="基础费用："></x-input>
      <x-input title="忙时费用："></x-input>
    </group>
    <box gap="20px 20px">
      <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="$router.push('/success')">提交</x-button>
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
  },
  methods: {
    submit() {
      const self = this
      if (this.carName == '') {
        AlertModule.show({
          title: '错误',
          content: '请输入车辆名'
        })
      } else if (this.amount == '') {
        AlertModule.show({
          title: '错误',
          content: '请输入总金额'
        })
      } else if (this.soldAmount == '') {
        AlertModule.show({
          title: '错误',
          content: '请输入发行代币'
        })
      } else if (this.price == '') {
        AlertModule.show({
          title: '错误',
          content: '请输入费用'
        })
      } else {
        window.CarManager.raisingNewCar(this.carName, this.desc, this.price, this.amount, this.imgs, this.soldAmount).then(username => {
          self.$router.push('/success')
        })
      }
    }
  }
}
</script>

<style less>
</style>
