<template>
  <section id='signup'>
    <h1>Sign up</h1>
    <div class="form">
      <div class="entry">
        <button @click="signup" name="signup">Sign up</button>
        <input name="pseudo" v-model="form.pseudo">
        <label for="pseudo">Pseudo</label>
      </div>
    </div>
  </section>
</template>

<script>
import Users from '@/js/users'

export default {
  name: 'signup',
  data () {
    return {
      form: {
        pseudo: undefined
      }
    }
  },
  beforeCreate: function () {
    Users.init()
  },
  methods: {
    signup: function () {
      let self = this
      if (typeof this.form.pseudo !== 'undefined' && this.form.pseudo !== '') {
        Users.create(this.form.pseudo).then(tx => {
          console.log(tx)
          self.$router.push('/')
        }).catch(err => {
          console.log(err)
        })
      }
    }
  }
}
</script>

<style scoped>

</style>
