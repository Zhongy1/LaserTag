import Player from './Player';

export default class WaitingRoom {

    private roomID: number;
    private players: Player[];

    constructor(roomID: number) {
        this.roomID = roomID;
        this.players = [];
    }

    public addPlayer(player: Player): void {
        this.players.push(player);
    }

    public removePlayer(playerID: string) {
        this.players = this.players.filter((player) => player.id != playerID);
    }
}