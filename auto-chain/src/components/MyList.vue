<template>
  <div style="position:fixed;width:100%;display:block;">
    <!--<group>-->
    <flexbox :gutter="0" style="margin: 10px">
      <flexbox-item :span="1/5">
        <img :src="require('../assets/images/header.jpeg')"
             style="width:100%;display:block;"></flexbox-item>
      <flexbox-item :span="4/5">
        <cell :title="'用户名：'" :value="username">
          <x-button v-if="!isSignedUp" mini :gradients="['#FF5E3A', '#FF9500']"
                    @click.native="$router.push('/register')">注册
          </x-button>
        </cell>
        <cell :title="'我的地址：'":value="address">
        </cell>
      </flexbox-item>
    </flexbox>
    <!--</group>-->
    <!--<load-more tip="工作列表" :show-loading="false" background-color="#fbf9fe"></load-more>-->
    <group>
      <cell is-link @click.native="$router.push('/myCard')">
        <span slot="title"><span style="vertical-align:middle;">我的车辆</span> <badge
          text="3"></badge></span>
      </cell>
      <cell is-link @click.native="$router.push('/myAccount')">
        <span slot="title"><span style="vertical-align:middle;">资金流水</span> <badge
          text="15"></badge></span>
      </cell>
    </group>
    <!--<load-more tip="操作项" :show-loading="false" background-color="#fbf9fe"></load-more>-->
    <box gap="20px 40px">
      <x-button :gradients="['#FF2719', '#FF61AD']" @click.native="$router.push('/collect')">我要募集</x-button>
    </box>
  </div>
</template>

<script>
  import {LoadMore, Badge, Group, Cell, Box, Flexbox, FlexboxItem, XInput, XButton} from 'vux'

  export default {
    components: {
      XButton,
      Badge,
      LoadMore,
      Group,
      Cell,
      Box,
      Flexbox,
      FlexboxItem,
      XInput
    },
    data() {
      return {
        isSignedUp: false,
        username: '',
        address: '',
      }
    },
    mounted() {
      console.log("mylist")
      this.address = window.address.substring(0,20)+'...'
      console.log(this.address)
      const self = this
      window.CarManager.login().then(username => {
          if (username) {
            self.isSignedUp = true
            self.username = username
            console.log('log=' + username)
          }
        }).catch(err => {
          console.log(err)
          this.username = ''
        })
    }

  }
</script>

<style less>
</style>
