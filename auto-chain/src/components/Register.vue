<template>
  <div style="position:fixed;width:100%;display:block;">
    <div style="padding:0 10px;">
      <!--<box gap="20px 20px">-->
        <p class="center"><img :src="require('../assets/images/header.jpeg')"></p>
      <!--</box>-->
      <group>
        <x-input title="用户名：" v-model="username"></x-input>
      </group>
      <box gap="20px 50px">
        <x-button :gradients="['#FF2719', '#FF61AD']" @click.native="register">提交注册</x-button>
      </box>
    </div>
  </div>
</template>

<script>
import {Box, Group, XInput, XButton, AlertModule} from 'vux'

export default {
  components: {
    Box,
    XInput,
    XButton,
    Group,
    AlertModule
  },
  data () {
    return {
      username: ''
    }
  },
  methods: {
    register: function () {
      const self = this
      if (this.username == ''){
        AlertModule.show({
          title: '错误',
          content: '请输入用户名'
        })
      } else {
        try {
          window.CarManager.signup(this.username).then(tx => {
            console.log(tx)
            self.$router.push('/success')
          })
        } catch(err){
          AlertModule.show({
            title: '发生错误',
            content: err.message
          })
        }
      }
    }
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
