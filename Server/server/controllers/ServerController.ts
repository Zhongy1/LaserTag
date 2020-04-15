import WebSocket from 'ws';
import WaitingRoom from '../models/WaitingRoom';
import Player from '../models/Player';
import GameRoom from '../models/GameRoom';

import chalk from 'chalk';

/**
 * Object which contains information parsed from an incoming message.
 * Contains info about the command's validity, command type (connect, attack), and any additional arguments
 */
export interface Command {
    valid: boolean,
    type: string,
    args: string[]
}

/**
 * The main logic for the laser tag server
 */
export default class ServerController {

    private connections: { [key: string]: WebSocket };
    private players: Player[];
    private hasStarted: boolean;
    public waitingRoom: WaitingRoom;
    public gameRoom: GameRoom;
    public wss: WebSocket.Server;

    constructor() {
        this.waitingRoom = new WaitingRoom();
        this.gameRoom = new GameRoom();
        this.connections = {};
        this.players = [];
        this.hasStarted = false;
    }


    /**
     * Starts the WebSocket server and begins accepting socket connections/messages
     * from the microcontrollers & the front end.
     */
    public start(): void {
        // Stop if the server has already started
        if (this.hasStarted) {
            return;
        }

        // Instantiate socket server
        this.wss = new WebSocket.Server({ port: 8080 });

        // Handle each new connection
        this.wss.on('connection', ws => {
            // Log new connection and send response
            console.log(chalk.cyan.inverse(' INFO ') + ' ' + 'New connection');
            ws.send('socket connected');

            // Handle incoming messages
            ws.on('message', message => {
                // Log incoming message
                console.log(chalk.cyan.inverse(' INFO ') + ' Server received: ' + message);

                // Parse out command from the incoming message
                const command = this.parseAndValidate(message.toString());

                // Take action based on the command
                if (command.valid) {
                    switch (command.type) {
                        case 'connect':
                            console.log('DEBUG: Server received a connect command.');
                            this.handleNewConnection(ws, command.args[0]);
                            break;

                        case 'move':
                            console.log('DEBUG: Server received a move command.');
                            const id = parseInt(command.args[0]);
                            const room = command.args[1];
                            this.movePlayerTo(id, room);
                            break;

                        // case 'attack':
                        //     // ...
                        //     break;
                    }
                } else {
                    console.log(`Error: Command "${message}" is invalid.`);
                }

                // Print newline between messages
                console.log();
            });
        });
    }


    /**
     * Accepts a raw incoming message from a socket and parses it into
     * a new Command object that is recognized by the server.
     *
     * Command line arguments are checked and validated against the given command.
     *
     * @param message - the message string to process
     * @returns the newly parsed and validated Command object
     */
    private parseAndValidate(message: string): Command {
        // Create new Command object for this message
        const command: Command = {
            valid: false,
            type: message.substring(1, message.indexOf(' ')),
            args: null
        }

        // Get command line arguments from the message
        const argString = message.substring(message.indexOf(' ') + 1);

        // Validate command args and update Command object accordingly
        switch (command.type) {
            case 'connect':
                // Check if first letter of command argument is B or S
                if (argString[0] === 'B' || argString[0] === 'S') {
                    command.valid = true;
                }
                command.args = [argString];
                break;

            case 'move':
                command.args = argString.split(' ');

                // TODO: implement error checking
                command.valid = true;
                break;

            // case 'attack':
            //     let attacker = argString.substring(0, argString.indexOf(' '));
            //     let target = argString.substring(message.indexOf(' ') + 1)
            //     command.args = [attacker, target];

            //     // Check if attacker and target make sense
            //     command.valid = this.isValidAttack(attacker, target);
            //     break;
        }

        return command;
    }


    /**
     * Once a new socket connection is established and a valid connection message
     * is received by the server, register the connection in our internal connections map.
     *
     * Once two connections of a pair (blaster/vest) connect to the server, create a new Player object
     * and add them to the waiting room.
     *
     * @param ws - the WebSocket connection object
     * @param id - the identifier for this connection, extracted from /connect args (e.g. S1, B1)
     */
    private handleNewConnection(ws: WebSocket, id: string) {
        // DEBUG
        console.log('DEBUG: registering connection ' + id);

        // Put id:ws pair into the connections array
        this.connections[id] = ws;

        // Get the type of microcontroller connection
        const type = (id[0] == 'B') ? 'Blaster' : 'Vest';

        // Once a pair of microcontrollers connect, create a new Player add them to the waiting room
        Object.keys(this.connections).forEach(kId => {
            switch (type) {
                case 'Blaster':
                    if (kId[0] == 'S' && kId.substring(1) == id.substring(1)) {
                        this.createAndAddPlayer(parseInt(id.substring(1)));
                    }
                    break;

                case 'Vest':
                    if (kId[0] == 'B' && kId.substring(1) == id.substring(1)) {
                        this.createAndAddPlayer(parseInt(id.substring(1)));
                    }
                    break;
            }
        });

        // Debug
        this.printAllConnections();
    }

    /**
     * Creates a new Player object with the given id and adds them to the waiting room.
     *
     * @param id - the id of the player to create
     */
    private createAndAddPlayer(id: number): void {
        console.log(`DEBUG: creating new player with id ${id}`); // DEBUG

        // Create a new Player from info in the connections map
        const player = new Player(this.connections['B' + id], this.connections['S' + id], id)

        this.players.push(player);
        this.waitingRoom.addPlayer(player);

        this.printAllPlayers();
        this.waitingRoom.printPlayers(); // DEBUG
    }


    /**
     * Moves the given Player between rooms
     *
     * @param playerid - the player to move
     * @param room - the room to move the player into
     */
    private movePlayerTo(playerid: number, room: string): void {
        console.log(`DEBUG: moving player ${playerid} to room ${room}`); // DEBUG

        // Get player object
        const playerToMove = this.players.find(player => player.id === playerid);

        switch (room) {
            case 'waitingroom':
                this.waitingRoom.addPlayer(playerToMove);
                this.gameRoom.removePlayer(playerToMove);

                this.waitingRoom.printPlayers(); // DEBUG
                this.gameRoom.printPlayers();
                break;

            case 'gameroom':
                this.waitingRoom.removePlayer(playerToMove);
                this.gameRoom.addPlayer(playerToMove);

                this.waitingRoom.printPlayers(); // DEBUG
                this.gameRoom.printPlayers();
                break;

            default:
                console.log('Error in movePlayer(): invalid room.');
        }
    }

    /**
     * Prints to the console the list of all WebSocket connections to the server
     */
    private printAllConnections(): void {
        console.log('In connections array: ');
        Object.keys(this.connections).forEach(id => console.log('- ' + id));
    }

    /**
     * Prints to the console the list of all Player objects currently
     * connected and recognized by the ServerController
     */
    private printAllPlayers(): void {
        console.log('Connected players: ');
        this.players.forEach(player => console.log('- ' + player.id));
    }

    // private isValidAttack(attacker: string, target: string): boolean {
    //     // Check that blasters are attacking vests
    //     if (attacker[0] !== 'B' || target[0] !== 'S') {
    //         return false;
    //     }

    //     // ... doesPlayerExist()
    //     return true;
    // }
}
