<template>
  <div style="text-align:center;margin-top:45%;">
    <bax ga="20px 20px">
      <icon type="success" is-msg></icon>
      <load-more tip="操作完成" :show-loading="false" background-color="#fbf9fe"></load-more>
    </bax>
  </div>
</template>

<script>
import {Box, Icon, LoadMore} from 'vux'

export default {
  components: {
    LoadMore,
    Icon,
    Box
  },
  data() {
    return {
      list: [['别克凯越', '丰田凯美瑞', '摩拜']]
    }
  }
}
</script>

<style less>
</style>
