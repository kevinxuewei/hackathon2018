<template>
  <div>
    <img slot="header" :src="require('../assets/images/' + this.randomNumber + '.jpg')"
         style="width:100%;display:block;">
    <div slot="content" class="card-padding">
      <group :title="'费用单位为 代币/小时'">
        <x-input title="车辆名称：" :max="10" v-model="carName"></x-input>
        <x-input title="总金额(WEI)：" v-model="price"></x-input>
        <x-input title="总代币：" v-model="amount"></x-input>
        <x-input title="募集代币：" v-model="soldAmount"></x-input>
        <x-input title="用车费用：" v-model="rentAmount"></x-input>
      </group>
      <box gap="20px 20px">
        <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="submit">发起募集</x-button>
      </box>
    </div>
  </div>
</template>

<script>
  import {Box, XButton, Group, XInput, AlertModule} from 'vux'

  export default {
    components: {
      Box,
      XButton,
      XInput,
      Group,
      AlertModule
    },
    data() {
      return {
        carName: "",
        amount: "",
        soldAmount: "",
        rentAmount: "",
        desc: "",
        imgs: "",
        price: "",
        randomNumber: Math.floor(Math.random()*19) + 1
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
            content: '请输入总代币'
          })
        } else if (this.rentAmount == '') {
          AlertModule.show({
            title: '错误',
            content: '请输入用车费用'
          })
        } else if (this.soldAmount == '') {
          AlertModule.show({
            title: '错误',
            content: '请输入要募集的代币'
          })
        } else if (this.price == '') {
          AlertModule.show({
            title: '错误',
            content: '请输入ETH价格'
          })
        } else if (parseInt(this.soldAmount) > parseInt(this.amount)) {
          AlertModule.show({
            title: '错误',
            content: '出让代币不可大于总代币'
          })
        } else {
          window.CarManager.raisingNewCar(this.carName, this.desc, this.price, this.amount, this.imgs, this.soldAmount, this.rentAmount).then(username => {
            self.$router.push('/success')
          })
        }
      }
    }
  }
</script>

<style less>
</style>
