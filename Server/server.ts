import * as path from 'path';
import * as http from 'http';
import * as WebSocket from 'ws';
import * as express from 'express';
import * as serveStatic from 'serve-static';
import { StringDecoder } from './string-decoder';

const server = http.createServer();
const wss = new WebSocket.Server({ port: 8080 });

console.log('Starting server...');

var app = express();
app.use(express.static('public'));
app.use(serveStatic(path.resolve(__dirname, 'public')));
server.on('request', app);

console.log('Server is online!');

wss.on('connection', function connection(ws) {
    ws.on('message', function incoming(message) {
        message = message.toString();
        console.log('received: ' + message);

        switch (message) {
            case 'connected':
                break;

            case 'yes':
                console.log('-> server has received a yes message');
                break;

            case 'no':
                console.log('-> server has received a no message, requesting a yes message from client');
                ws.send('I need a yes from you');
                break;

            default:
                console.log('-> converting from hex to string:');
                let hexMessage: string = StringDecoder.hexToString(message);
                console.log('-> ' + hexMessage);
                ws.send('message received');
        }
    });
});


app.listen(8000);
