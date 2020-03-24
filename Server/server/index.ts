// @ts-ignore
import { Nuxt, Builder } from 'nuxt';
import config from '../nuxt.config';
import consola from 'consola';
import express from 'express';

import ServerController from './controllers/ServerController';

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

    // Initialize laser tag server and begin accepting socket connections
    const laserTagServer = new ServerController();
    laserTagServer.start();

    // Finish
    consola.ready({
        message: `Server is online! Visit at http://localhost:${port}`,
        tag: 'express:lasertag',
        badge: true
    });
}
start()
