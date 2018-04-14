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
        <box gap="20px 20px">
        <x-button :gradients="['#1D62F0', '#19D5FD']" @click.native="$router.push('/use')">我要用车</x-button>
        <x-button :gradients="['#FF5E3A', '#FF9500']" @click.native="$router.push('/back')">我要回购</x-button>
        </box>
      </group>
    </div>
  </div>
</template>

<script>
  import { Box, XButton,CellFormPreview, Group, Cell } from 'vux'

  export default {
    props: ['imgSrc'],
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
          value: '1500,000 WEI'
        }, {
          label: '发型代币',
          value: '1500,000'
        }, {
          label: '车主位置',
          value: '清河'
        }, {
          label: '募集进度',
          value: '1500,000 / 1500,000'
        }],
        list2: [{
          label: '0x2b323ef8...',
          value: '35.23%'
        }, {
          label: '0x9f3a829e...',
          value: '25.43%'
        }, {
          label: '0xa83f90b3...',
          value: '39.34%'
        }]
      }
    }
  }
</script>

<style less>
</style>
