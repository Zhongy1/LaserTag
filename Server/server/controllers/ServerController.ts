import WebSocket from 'ws';
import Player from './Player';
import WaitingRoom from './WaitingRoom';
import Player from '../models/Player';

export default class ServerController {
    private connections: { [key: string]: WebSocket };

    public waitingRoom: WaitingRoom;

    constructor() {
        this.waitingRoom = new WaitingRoom();
        this.connections = {};
    }

    public parseCmd(message: string) {

    }
    public handle(ws: WebSocket, id: string) {
        this.connections[id] = ws;
        let type = (id[0] == 'B') ? 'Blaster' : 'Vest';
        Object.keys(this.connections).forEach(kId => {
            switch (type) {
                case 'Blaster':
                    if (kId[0] == 'S' && kId.substring(1) == id.substring(1))
                        this.addPlayer(parseInt(id.substring(1)));
                    break;
                case 'Vest':
                    if (kId[0] == 'B' && kId.substring(1) == id.substring(1))
                        this.addPlayer(parseInt(id.substring(1)));
                    break;
            }
        });
    }

    private addPlayer(id: number): void {
        this.waitingRoom.addPlayer(new Player(this.connections['B' + id], this.connections['S' + id], id));
    }

    private addPlayerExisting(player: Player): void {
    }
    private removePlayer(id: number): void {
        this.waitingRoom.removePlayer(id);
    }
}