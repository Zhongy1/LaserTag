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

    public removePlayer(playerID: number) {
        this.players = this.players.filter((player) => player.getID() != playerID);
    }
}
