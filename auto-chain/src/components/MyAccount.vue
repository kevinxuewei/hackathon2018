<template>
  <div style="position:fixed;width:100%;display:block;">
    <load-more tip="我的资金流水" :show-loading="false" background-color="#fbf9fe"></load-more>
    <div style="padding:0 10px;">
      <x-table>
        <thead>
        <tr>
          <th>操作</th>
          <th>金额</th>
          <th>时间</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>BUY</td>
          <td>+86120</td>
          <td>2018-04-14 22:33:23</td>
        </tr>
        <tr>
          <td>RENT</td>
          <td>-160</td>
          <td>2018-04-14 22:35:12</td>
        </tr>
        <tr>
          <td>INCOME</td>
          <td>+42</td>
          <td>2018-04-14 22:50:48</td>
        </tr>
        </tbody>
      </x-table>
    </div>
  </div>
</template>

<script>
import {XTable, LoadMore} from 'vux'

export default {
  components: {
    XTable,
    LoadMore
  },
  data () {
    return {}
  }
}
</script>

<style less>
</style>
