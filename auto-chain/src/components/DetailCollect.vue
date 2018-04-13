<template>
  <div>
    <img slot="header" :src="'https://o5omsejde.qnssl.com/demo/test1.jpg'"
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
    </div>
  </div>
</template>

<script>
  import { CellFormPreview, Group, Cell } from 'vux'

  export default {
    props: ['imgSrc'],
    components: {
      CellFormPreview,
      Group,
      Cell
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
        }]
      }
    }
  }
</script>

<style less>
</style>
