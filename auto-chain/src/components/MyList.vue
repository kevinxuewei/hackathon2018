<template>
  <div>
    <load-more tip="个人中心" :show-loading="false" background-color="#fbf9fe"></load-more>
    <group>
      <cell is-link @click.native="$router.push('/car/myCard')">
        <span slot="title"><span style="vertical-align:middle;">我的车辆</span> <badge
          text="3"></badge></span>
      </cell>
      <cell is-link @click.native="$router.push('/car/myAccount')">
        <span slot="title"><span style="vertical-align:middle;">资金流水</span> <badge
          text="15"></badge></span>
      </cell>
    </group>
  </div>
</template>

<script>
import {LoadMore, Badge, Group, Cell} from 'vux'

export default {
  components: {
    Badge,
    LoadMore,
    Group,
    Cell
  },
  data() {
    return {}
  }
}
</script>

<style less>
</style>
