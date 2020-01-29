// @ts-ignore
import { Nuxt, Builder } from 'nuxt';
import config from '../nuxt.config';
import consola from 'consola';
import chalk from 'chalk';
import express from 'express';
import WebSocket from 'ws';

// Start Express server
const app = express();

async function start() {
    // Init Nuxt.js, set node env, set port
    const nuxt = new Nuxt(config);
    config.dev = process.env.NODE_ENV !== 'production';
    const port = nuxt.options.server.port;

    // Build only in dev mode
    if (config.dev) {
        const builder = new Builder(nuxt);
        await builder.build();
    } else {
        await nuxt.ready();
    }

    // Give Nuxt middleware to Express
    app.use(nuxt.render);
    
    // Listen for web requests
    app.listen(port);
    
    // Initialize socket server and handle socket requests
    const wss = new WebSocket.Server({ port: 8080 });
    var signal = '20DF10EF';

    wss.on('connection', ws => {
        console.log(chalk.cyan.inverse(' INFO ') + ' ' + 'New connection');
        ws.send('socket connected');

        ws.on('message', message => {
            console.log(chalk.cyan.inverse(' INFO ') + ' ' + 'received: ' + message);
            message = message.toString();

            switch (message) {
                case '/getoutput':
                    console.log(`Client is asking for an the output signal to use; giving it ${signal}`);
                    ws.send(`02${signal}`);
                    break;
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

    // Finish
    consola.ready({
        message: `Server is online! Visit at http://localhost:${port}`,
        tag: 'express:lasertag',
        badge: true
    });
}
start()
