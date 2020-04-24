<script>
export default {
    render: () => null,

    created() {
        this.establishWebSocketConnection();
    },

    methods: {
        establishWebSocketConnection() {
            // Bind ws to the window so it's accessible by the web console
            window.ws = new WebSocket('ws://' + location.hostname + ':8080');

            // event emmited when connected
            window.ws.onopen = () => console.log('websocket is connected ...');

            // event emmited when receiving message
            window.ws.onmessage = ev => console.log(ev);
        }
    }
}
</script>
