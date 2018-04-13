<template>
  <div style="position:fixed;text-align:center;margin-top:45%;">
    <box gap="20px 20px">
      <icon type="success" is-msg></icon>
      <load-more tip="操作完成" :show-loading="false" background-color="#fbf9fe"></load-more>
    </box>
  </div>
</template>

<script>
import {Box, Icon, LoadMore} from 'vux'

export default {
  components: {
    LoadMore,
    Icon,
    Box
  }
}
</script>

<style less>
</style>
