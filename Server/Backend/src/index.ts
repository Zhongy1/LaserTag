import ServerController from './controllers/ServerController';

// Initialize laser tag server and begin accepting socket connections
const laserTagServer = new ServerController();
laserTagServer.start();
