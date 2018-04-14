<template>
  <div style="position:fixed;width:100%;display:block;">
    <group :title="'费用单位为 代币/小时'">
      <popup-picker title="车辆选择" :data="list" v-model="car" value-text-align="left"></popup-picker>
    </group>
    <box gap="20px 20px">
      <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="submit">提交</x-button>
    </box>
  </div>
</template>

<script>
import {Box, XButton, XInput, Group, AlertModule, PopupPicker} from 'vux'

export default {
  components: {
    PopupPicker,
    Box,
    XButton,
    XInput,
    AlertModule,
    Group
  },
  data () {
    return{
      list: [],
      car: ''
    }
  },
  mounted() {
    window.CarManager.getRaisingCardList().then(res => {
      this.list.push(res)
    })
  },
  methods: {
    submit() {
      const self = this
      if (this.car == '') {
        AlertModule.show({
          title: '错误',
          content: '请选择车辆'
        })
      } else {
        // window.CarManager.buyNewCar(this.car, this.amount, this.soldAmount).then(res => {
          self.$router.push('/success')
        // })
      }
    }
  }
}
</script>

<style less>
</style>
