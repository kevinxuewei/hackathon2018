<template>
  <div style="position:fixed;width:100%;display:block;">
    <div style="padding:0 10px;">
      <!--<box gap="20px 20px">-->
        <p class="center"><img :src="require('../assets/images/header.jpeg')"></p>
      <!--</box>-->
      <group>
        <x-input title="用户名："></x-input>
      </group>
      <box gap="20px 50px">
        <x-button :gradients="['#FF2719', '#FF61AD']" @click.native="$router.push('/success')">提交注册</x-button>
      </box>
    </div>
  </div>
</template>

<script>
import {Box, Group, XInput, XButton} from 'vux'

export default {
  components: {
    Box,
    XInput,
    XButton,
    Group
  },
  data () {
    return {}
  }
}
</script>

<style less>
  .center {
    text-align: center;
    padding-top: 20px;
    color: #fff;
    font-size: 18px;
  }
  .center img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border: 4px solid #ececec;
  }
</style>
