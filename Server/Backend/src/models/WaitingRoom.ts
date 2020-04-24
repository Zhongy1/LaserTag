import Player from './Player';

export default class WaitingRoom {
    public players: Player[];
    public roomID: number;

    constructor() {
        this.roomID = 0;
        this.players = [];
    }

    public addPlayer(player: Player): void {
        this.players.push(player);
    }

    public removePlayer(playerToDelete: Player): void {
        this.players = this.players.filter(player => player != playerToDelete);
    }

    public printPlayers(): void {
        console.log('In waiting room: ');
        this.players.forEach(player => console.log('- ' + player.id));
    }
}
