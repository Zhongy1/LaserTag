import * as path from 'path';
import * as http from 'http';
import * as WebSocket from 'ws';
import * as express from 'express';
import * as serveStatic from 'serve-static';

const server = http.createServer();
const wss = new WebSocket.Server({ port: 8080 });

console.log('Starting server');

var app = express();
app.use(express.static('public'));
app.use(serveStatic(path.resolve(__dirname, 'public')));
server.on('request', app);

wss.on('connection', function connection(ws) {
    ws.on('message', function incoming(message) {
        console.log('received: %s', message);
        if (message == 'yes') {
            console.log('server has received a yes message');
        }
        if (message == 'no') {
            console.log('server has received a no message, requesting a yes message from client');
            ws.send('I need a yes from you');
        }
    });
});


app.listen(8000);
