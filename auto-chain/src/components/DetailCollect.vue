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
        <x-input :title="'购买代币'" :value="buyAmount"></x-input>        
      </group>
      <group>
        <box gap="20px 20px">
        <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="$router.push('/use')">我要参与购买</x-button>
        </box>
      </group>
    </div>
  </div>
</template>

<script>
  import { CellFormPreview, Group, Cell, XButton, XInput } from 'vux'

  export default {
    props: ['imgSrc'],
    components: {
      CellFormPreview,
      Group,
      Cell,
      XButton,
      XInput
    },
    data () {
      return {
        list1: [{
          label: '总金额',
          value: '1500,000 WEI'
        }, {
          label: '发行代币',
          value: '1500,000'
        }, {
          label: '车主位置',
          value: '清河'
        }, {
          label: '募集进度',
          value: '1028,231 / 1500,000'
        }],
        list2: [{
          label: '0x2b323ef8...',
          value: '35.23%'
        }, {
          label: '0x9f3a829e...',
          value: '25.43%'
        }],
        buyAmount: 0
      }
    }
  }
</script>

<style less>
</style>
