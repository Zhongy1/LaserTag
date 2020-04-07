import WebSocket from 'ws';
import { Team } from './GameRoom';

export default class Player {

    private readonly blaster: WebSocket;
    private readonly vest: WebSocket;
    private alive: boolean;
    public readonly id: number;
    public team: Team;
    public score: number;

    constructor(blaster: WebSocket, vest: WebSocket, id: number, alive: boolean = true) {
        this.blaster = blaster;
        this.vest = vest;
        this.alive = alive;
        this.id = id;
    }

    /**
     * Sends a message to the blaster node of this player
     *
     * @param message - the message to send
     */
    public toBlaster(message: string): void {
        this.blaster.send(message);
    }

    /**
     * Sends a message to the vest node of this player
     *
     * @param message - the message to send
     */
    public toVest(message: string): void {
        this.vest.send(message);
    }

    public isAlive(): boolean {
        return this.alive;
    }

    public kill(): void {
        this.alive = false;
    }

    public revive(): void {
        this.alive = true;
    }
}
