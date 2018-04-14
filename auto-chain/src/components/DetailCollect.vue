<template>
  <div>
    <img slot="header" :src="require('../assets/images/1.jpg')"
         style="width:100%;display:block;">
    <div slot="content" class="card-padding">
      <group>
        <cell :title="'车辆名称'" :value="'别克凯越2016 1.6L'"></cell>
        <cell-form-preview :list="list1"></cell-form-preview>
      </group>
      <group>
        <cell :title="'募集详情'" :value="''"></cell>
        <cell-form-preview :list="list2"></cell-form-preview>
      </group>
      <group>
        <x-number fillable :title="'购买代币量：'" v-model="amount" button-style="round" :min="0"></x-number>
        <box gap="20px 50px">
          <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="submit">我要参与</x-button>
        </box>
      </group>
    </div>
  </div>
</template>

<script>
  import { CellFormPreview, Group, Cell, AlertModule, XNumber, Box } from 'vux'
  import XButton from "vux/src/components/x-button/index";

  export default {
    props: ['imgSrc'],
    components: {
      XButton,
      CellFormPreview,
      Group,
      Cell,
      XNumber,
      AlertModule,
      Box
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
        }],
        list2: [{
          label: '车主一',
          value: '35%'
        }, {
          label: '车主二',
          value: '25%'
        }, {
          label: '车主三',
          value: '10%'
        }],
        amount: 0,
        cardId: 0
      }
    },
    methods: {
      submit() {
        const self = this
        if (this.amount == 0) {
          AlertModule.show({
            title: '错误',
            content: '代币量不能为0'
          })
        } else {
          // window.CarManager.buyNewCar(this.cardId, this.amount).then(res => {
            self.$router.push('/success')
          // })
        }
      }
    }
  }
</script>

<style less>
</style>
