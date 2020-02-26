import Player from './Player';

export default class WaitingRoom {
    private players: Player[];
    public readonly roomID: number;

    constructor(roomID: number) {
        this.roomID = roomID;
        this.players = [];
    }

    public addPlayer(player: Player): void {
        this.players.push(player);
    }

    public removePlayer(playerID: string): void {
        this.players = this.players.filter((player) => player.id != parseInt(playerID));
    }

    public get(id: number): Player {
        return this.players[id];
    }
}
