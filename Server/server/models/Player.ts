import WebSocket from 'ws';

export default class Player {
    private blaster: WebSocket;
    private vest: WebSocket;
    private team: string;

    constructor(blaster: WebSocket, vest: WebSocket, team: string = 'default') {
        this.blaster = blaster;
        this.vest = vest;
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

    public getTeam(): string {
        return this.team;
    }
}
