import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import DetailCollect from '@/components/DetailCollect'
import DetailMe from '@/components/DetailMe'
import Collect from '@/components/Collect'
import MyAccount from '@/components/MyAccount'
import MyCard from '@/components/MyCard'
import MyList from '@/components/MyList'
import Rent from '@/components/Rent'
import Success from '@/components/Success'
import Use from '@/components/Use'
import Signup from '@/components/Signup'
import Back from '@/components/Back'
import Register from '@/components/Register'
import Test from '@/components/Test'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/home'
    },
    {
      path: '/home',
      name: '主页',
      component: Home
    },
    {
      path: '/signup',
      name: '登录',
      component: Signup
    },
    {
      path: '/detailCollect',
      name: '募集详情',
      component: DetailCollect
    },
    {
      path: '/detailMe',
      name: '车辆详情',
      component: DetailMe
    },
    {
      path: '/collect',
      name: '我要募集',
      component: Collect
    },
    {
      path: '/myAccount',
      name: '资金流水',
      component: MyAccount
    },
    {
      path: '/myCard',
      name: '我的车辆',
      component: MyCard
    },
    {
      path: '/myList',
      name: '个人中心',
      component: MyList
    },
    {
      path: '/rent',
      name: '发起募集',
      component: Rent
    },
    {
      path: '/success',
      name: '完成',
      component: Success
    },
    {
      path: '/use',
      name: '我要用车',
      component: Use
    },
    {
      path: '/back',
      name: '我要回购',
      component: Back
    },
    {
      path: '/register',
      name: '注册',
      component: Register
    },
    {
      path: '/test',
      name: 'Test',
      component: Test
    }
  ]
})
