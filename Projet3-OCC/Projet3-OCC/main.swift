
import Foundation

//INITIALIZING VARIABLES
var heroe: Character // THE CHARACTER TO PLAY SELECT BY THE PLAYER
var enemy: Character // THE CHARACTER TO FIGHT OR HEAL SELECT BY THE PLAYER
var target: Character // THE CHARACTER HIT BY THE DRAGON
var counter: Int = 0 // TO DETERMINE WHO PLAY

// PRESENTATION TEXT
print("-----------------------------------------------------------------------------------------------------------------")
print("🤓: - Hi, I'm Gandalf the geek, my mission is to assist you during the adventure")
sleep(2)
print("      You are in Swiftwar, a game product for Openclassroom")
sleep(2)
print("      The rules: no rules, just 2 teams of 3 Heroes will fight")
print("-----------------------------------------------------------------------------------------------------------------")


// CREATION OF TEAM 1
sleep(2)
print("🤓: - Team 1: You can select your 3 heroes!")
print("-----------------------------------------------------------------------------------------------------------------")
sleep(2)
currentTeam = team1  // CREATETEAMCHARACTERS() USE CURRENTTEAM
createTeamCharacters()

//CREATION OF TEAM 2
sleep(2)
print("🤓: - Team 2: You can select your 3 heroes!")
print("-----------------------------------------------------------------------------------------------------------------")
sleep(2)
currentTeam = team2  // CREATETEAMCHARACTERS() USE CURRENTTEAM
createTeamCharacters()

// TEAMS COMPOSED
sleep(2)
print("🤓: - Teams are composed, good luck , and that the best win")
print("-----------------------------------------------------------------------------------------------------------------")
sleep(2)

// FUNC THAT DETERMINES THE BEGINNER
randomBegin()

// SELECT CHARACTERS, BOX AND FIGHT
while testTeam1Life() == true && testTeam2Life() == true{
      central()
}

// END OF THE GAME , SHOWING THE WINNER
sleep(2)
printWinner()

