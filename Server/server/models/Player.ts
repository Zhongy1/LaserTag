import WebSocket from 'ws';

export default class Player {
    private readonly blaster: WebSocket;
    private readonly vest: WebSocket;
    private alive: boolean;
    public readonly id: number;
    public team: string;

    constructor(blaster: WebSocket, vest: WebSocket, id: number, alive: boolean = true, team: string = 'default') {
        this.blaster = blaster;
        this.vest = vest;
        this.alive = alive;
        this.id = id;
        this.team = team;
        this.listen();
    }

    private listen(): void {
        this.blaster.on('message', message => {
           console.log("In player: " + message);
        });

        this.vest.on('message', message => {
            console.log("In player: " + message);
        });
    }

    public toBlaster(message: string): void {
        this.blaster.send(message);
    }

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
