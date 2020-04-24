<template>
    <div id="app">
        <HelloWorld msg="Welcome to Your Vue.js App"/>
        <Socket />
    </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue';
import Socket from './components/Socket.vue';

export default {
    name: 'App',
    components: { HelloWorld, Socket }
}
</script>

<style lang="scss">
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
}
</style>
