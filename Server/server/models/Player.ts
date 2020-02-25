import WebSocket from 'ws';

export default class Player {
    private blaster: WebSocket;
    private vest: WebSocket;
    private id: number;
    private team: string;
    private isAlive: boolean;

    constructor(blaster: WebSocket, vest: WebSocket, id: number, isAlive: boolean = true, team: string = 'default') {
        this.blaster = blaster;
        this.vest = vest;
        this.id = id;
        this.team = team;
        this.isAlive = isAlive;
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

    public getID(): number {
        return this.id;
    }

    public setID(newID: number): void {
        this.id = newID;
    }

    public getTeam(): string {
        return this.team;
    }

    public setTeam(newTeam: string): void {
        this.team = newTeam;
    }

    public getAliveState(): boolean {
        return this.isAlive;
    }

    public setAliveState(newState: boolean): void {
        this.isAlive = newState;
    }
}
