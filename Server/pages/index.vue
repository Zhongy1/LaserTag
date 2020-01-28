<template>
  <div class="container">
    <div>
      <logo />
      <h1 class="title">
        lasertagserver
      </h1>
      <h2 class="subtitle">
        Server component of laser tag system
      </h2>
      <div class="links">
        <a
          href="https://nuxtjs.org/"
          target="_blank"
          class="button--green"
        >
          Documentation
        </a>
        <a
          href="https://github.com/nuxt/nuxt.js"
          target="_blank"
          class="button--grey"
        >
          GitHub
        </a>
      </div>
    </div>
    <script>
      var ws = new WebSocket('ws://' + location.hostname + ':8080');

        // event emmited when connected
        ws.onopen = function () {
            console.log('websocket is connected ...')

            // sending a send event to websocket server
            ws.send('/new')
        }

        // event emmited when receiving message 
        ws.onmessage = function (ev) {
            console.log(ev);
        }
    </script>
  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
