<template>
  <div>
    <img slot="header" :src="imgSrc"
         style="width:100%;height:60%;display:block;">
    <div slot="content" class="card-padding" style="height: 40%">
      <group>
        <cell :title="'Total'" :value="'$1024'"></cell>
        <cell-form-preview :list="list"></cell-form-preview>
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
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<style scoped>
</style>
