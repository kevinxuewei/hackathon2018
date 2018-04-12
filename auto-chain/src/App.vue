<template>
  <div style="height:100%;">
    <drawer
    width="200px;"
    >
      <!-- main content -->
      <view-box ref="viewBox" body-padding-top="46px" body-padding-bottom="55px">
        <x-header
        style="width: 100%; position: absolute; left: 0px; top: 0px; z-index: 100;"
        :left-options="leftOptions"
        :title="title"
        >
        </x-header>
        <router-view class="router-view"></router-view>
        <tabbar style="position: fixed;border-top:0">
          <tabbar-item link="/">
            <span slot="icon"><i data-feather="home"></i></span>
            <span slot="label">主页</span>
          </tabbar-item>
          <tabbar-item>
             <span slot="label"></span>
          </tabbar-item>
          <tabbar-item link="/me">
          <span slot="icon"><i data-feather="user"></i></span>
            <span slot="label">我的</span>
          </tabbar-item>
          <div style="position:fixed;bottom:85px;width:100%;height:0px;text-align:center;">
          <div class="btn-center">
            <i data-feather="plus" width="40" height="40" viewBox="0 0 40 40"></i>
          </div>
          </div>
        </tabbar>
      </view-box>
    </drawer>
  </div>
</template>
<script>
import {
  Radio,
  Group,
  Cell,
  Badge,
  Drawer,
  Actionsheet,
  ButtonTab,
  ButtonTabItem,
  ViewBox,
  XHeader,
  Tabbar,
  TabbarItem,
  Loading,
  TransferDom
} from 'vux'
import feather from 'feather-icons'
export default {
  directives: {
    TransferDom
  },
  components: {
    Radio,
    Group,
    Cell,
    Badge,
    Drawer,
    ButtonTab,
    ButtonTabItem,
    ViewBox,
    XHeader,
    Tabbar,
    TabbarItem,
    Loading,
    Actionsheet
  },
  computed: {
    leftOptions () {
      return {
        showBack: this.$route.path !== '/'
      }
    },
    title () {
      return this.$route.name
    }
  },
  mounted () {
    feather.replace()
  }
}
</script>
<style lang="less">
@import "~vux/src/styles/reset.less";
@import "~vux/src/styles/1px.less";
@import "~vux/src/styles/tap.less";
body {
  background-color: #fbf9fe;
}
html,
body {
  height: 100%;
  width: 100%;
  overflow-x: hidden;
}
.demo-icon-22 {
  font-family: "vux-demo";
  font-size: 22px;
  color: #888;
}
.weui-tabbar.vux-demo-tabbar {
  /** backdrop-filter: blur(10px);
  background-color: none;
  background: rgba(247, 247, 250, 0.5);**/
}
.vux-demo-tabbar .weui-bar__item_on .demo-icon-22 {
  color: #f70968;
}
.vux-demo-tabbar
  .weui-tabbar_item.weui-bar__item_on
  .vux-demo-tabbar-icon-home {
  color: rgb(53, 73, 94);
}
.demo-icon-22:before {
  content: attr(icon);
}
.vux-demo-tabbar-component {
  background-color: #f70968;
  color: #fff;
  border-radius: 7px;
  padding: 0 4px;
  line-height: 14px;
}
.weui-tabbar__icon + .weui-tabbar__label {
  margin-top: 0 !important;
}
.vux-demo-header-box {
  z-index: 100;
  position: absolute;
  width: 100%;
  left: 0;
  top: 0;
}
@font-face {
  font-family: "vux-demo"; /* project id 70323 */
  src: url("https://at.alicdn.com/t/font_h1fz4ogaj5cm1jor.eot");
  src: url("https://at.alicdn.com/t/font_h1fz4ogaj5cm1jor.eot?#iefix")
      format("embedded-opentype"),
    url("https://at.alicdn.com/t/font_h1fz4ogaj5cm1jor.woff") format("woff"),
    url("https://at.alicdn.com/t/font_h1fz4ogaj5cm1jor.ttf") format("truetype"),
    url("https://at.alicdn.com/t/font_h1fz4ogaj5cm1jor.svg#iconfont")
      format("svg");
}
.demo-icon {
  font-family: "vux-demo";
  font-size: 20px;
  color: #04be02;
}
.demo-icon-big {
  font-size: 28px;
}
.demo-icon:before {
  content: attr(icon);
}
.router-view {
  width: 100%;
  top: 46px;
  margin-bottom: 15px
}
.vux-pop-out-enter-active,
.vux-pop-out-leave-active,
.vux-pop-in-enter-active,
.vux-pop-in-leave-active {
  will-change: transform;
  transition: all 500ms;
  height: 100%;
  top: 46px;
  position: absolute;
  backface-visibility: hidden;
  perspective: 1000;
}
.vux-pop-out-enter {
  opacity: 0;
  transform: translate3d(-100%, 0, 0);
}
.vux-pop-out-leave-active {
  opacity: 0;
  transform: translate3d(100%, 0, 0);
}
.vux-pop-in-enter {
  opacity: 0;
  transform: translate3d(100%, 0, 0);
}
.vux-pop-in-leave-active {
  opacity: 0;
  transform: translate3d(-100%, 0, 0);
}
.menu-title {
  color: #888;
}
.btn-center{
  padding:15px;
  margin:0 auto;background-color:#63aeb8;
  height:40px;
  width:40px;
  border-radius:35px;
  box-shadow: 1px 1px 5px #888888;
  line-height:70px;
  font-size:10px;
  color:white;
}
</style>
