import WaitingRoom from "./WaitingRoom";
import Player from "./Player";

/**
 * Object which contains information about that specific team,
 * given to Player instances when they are assigned a team
 */
export interface Team {
    name: string,
    color: string
}

/**
 * Main logic for the laser tag game itself
 */
export default class GameRoom extends WaitingRoom {

    public teams: Team[];
    public maxTeams = 2;

    /**
     * Default constructor initializes room id to 1 and creates a default team with no color
     */
    constructor() {
        super();
        this.roomID = 1;
        const defaultTeam: Team = { name: 'default', color: 'none' };
        this.teams = [defaultTeam];
    }


    /**
     * Creates a new team with the given team name and team color.
     *
     * @param name - the name of the new team
     * @param color - the color to represent the new team
     */
    public createTeam(name: string, color: string): void {
        // Check if team name is already taken
        const doesTeamExist = this.teams.some(team => team.name === name);
        if (doesTeamExist) {
            console.log('Error in createTeam(): team already exists.');
            return;
        }

        // Check if team limit has been reached
        if (this.teams.length >= this.maxTeams) {
            console.log('Error in createTeam(): team limit reached.');
            return;
        }

        // Create new team, register it, and log
        const newTeam: Team = { name, color };
        this.teams.push(newTeam);
        console.log(`Successfully created team ${name} with color ${color}.`);
    }


    /**
     * Edits the name of the given team
     *
     * @param oldName - the name of the team to edit
     * @param newName - the new name of the team
     */
    public editTeamName(oldName: string, newName: string): void {
        // Get reference to the team to change
        const teamToEdit = this.teams.find(team => team.name === oldName);

        // If undefined, team doesn't exist
        if (teamToEdit === undefined) {
            console.log('Error in editTeamName(): invalid team name.');
            return;
        }

        // Update the team name and log
        teamToEdit.name = newName;
        console.log(`Successfully updated team ${oldName} to team ${newName}.`);
    }


    /**
     * Edits the color of the given team
     *
     * @param teamName - the name of the team to edit
     * @param newColor - the new color
     */
    public editTeamColor(teamName: string, newColor: string): void {
        // Get reference to the team to change
        const teamToEdit = this.teams.find(team => team.name === teamName);

        // If undefined, team doesn't exist
        if (teamToEdit === undefined) {
            console.log('Error in editTeamColor(): invalid team name.');
            return;
        }

        // Update the team color and log
        teamToEdit.color = newColor;
        console.log(`Successfully updated color property of team ${teamName} to ${newColor}.`);
    }


    /**
     * Adds the player to the given team.
     *
     * @param player - the player object to assign to
     * @param teamName - the name of the team to move the player into
     */
    public setTeam(player: Player, teamName: string): void {
        // Get reference to team object
        const newTeamObject = this.teams.find(team => team.name === teamName);

        // If undefined, team doesn't exist
        if (newTeamObject === undefined) {
            console.log('Error in setTeam(): invalid team name.');
            return;
        }

        // Set player's team and log
        player.team = newTeamObject;
        console.log(`Successfully added player ${player.id} to team ${teamName}.`);
    }


    /**
     * Prints to the console the list of existing teams and where players are assigned.
     */
    public listTeams(): void {
        this.teams.forEach(team => {
            console.log(team.name);

            this.players.forEach(player => {
                if (player.team.name === team.name) {
                    console.log(` - ${player.id}`);
                }
            });
        });
    }

    /**
     * Prints to the console all players that are currently in the game room.
     */
    public printPlayers(): void {
        console.log('In game room: ');
        this.players.forEach(player => console.log('- ' + player.id));
    }
}
