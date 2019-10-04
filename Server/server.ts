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
    });

    ws.send('something');
    console.log(ws);
    setInterval(() => {
    	ws.send('spamming you');
	console.log('trying to send');
    }, 1000);
});


app.listen(8000);
