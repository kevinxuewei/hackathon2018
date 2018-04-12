<template>
  <div>
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
          <td>购买XXX车股权</td>
          <td>-12.2312</td>
          <td>2018-04-09 22:33:23</td>
        </tr>
        <tr>
          <td>使用车3小时</td>
          <td>-0.23</td>
          <td>2018-04-09 22:33:23</td>
        </tr>
        <tr>
          <td>用车收益</td>
          <td>+0.032</td>
          <td>2018-04-09 22:33:23</td>
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
  data() {
    return {}
  }
}
</script>

<style less>
</style>
