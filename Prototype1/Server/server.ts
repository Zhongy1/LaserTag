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

var signal = '20DF10EF';

wss.on('connection', function connection(ws) {
    ws.on('message', function incoming(message) {
        message = message.toString();
        console.log('received: ' + message);

        switch (message) {
            case '/getoutput':
                console.log(`Client is asking for an the output signal to use; giving it ${signal}`);
                //ws.send(`0220DF10EF`);
                ws.send(`02${signal}`);
                break;

            //default:
            // console.log('-> converting from hex to string:');
            // let hexMessage: string = StringDecoder.hexToString(message);
            // console.log('-> ' + hexMessage);

            // if (hexMessage == null)
            //     ws.send("invalid");
            // else
            //     ws.send('received');
            //break;
            default:
                var cmd = message.substring(0, message.indexOf(' '));
                var msg = message.substring(message.indexOf(' ') + 1);
                switch (cmd) {
                    case '/sendMsg':
                        console.log(msg);
                        break;

                    case '/setoutput':
                        signal = msg;
                        console.log(`Client is trying to change output signal; new signal is going to be ${signal}`);
                        wss.clients.forEach((client) => {
                            client.send(`02${signal}`);
                        });
                        break;

                }
                break;
        }
    });
});


app.listen(8000);
