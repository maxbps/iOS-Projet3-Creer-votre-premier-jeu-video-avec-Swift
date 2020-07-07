//
//  game.swift
//  Projet3-OCC
//
//  Created by bontemps on 01/08/2018.
//  Copyright © 2018 bontemps. All rights reserved.
//

import Foundation

var team1 = Team(teamName: "team1")
var team2 = Team(teamName: "team2")
var currentTeam = Team(teamName: "currentteam") // Use to factor in one func
var charactersNames: [String] = [] // contain the names of heroes, use in name()
let randomnumber1: Int = Int(arc4random_uniform(101)) // IN THE FUNC RANDOMBEGIN-
let randomnumber2: Int = Int(arc4random_uniform(101)) // -to determinate who begins
var round = 0 // Round of the game, a simple counter


// SELECT THE HEROES THAT WILL COMPOSED THE TEAM
func createTeamCharacters() {
    var count = 0
    
    repeat {
        print("🤓: - Choose a character :")
        print("      1. ▻ A Knight, \(KNIGHTLIFE)PV \(SWORDDAMNAGE) Attack") // the "fighter"
        print("      2. ▻ A Wizard, \(WIZARDLIFE)PV \(STICKHEAL) Heal")
        print("      3. ▻ A Giant, \(GIANTLIFE)PV, \(AXEDAMNAGE) Attack")
        print("      4. ▻ A Dwarf, \(DWARFLIFE)PV, \(HAMMERDAMNAGE) Attack")
print("-----------------------------------------------------------------------------------------------------------------")
        
        if let chooseType = readLine() {
            
            
            switch chooseType {
            case "1":
                print("🤓: - You have selected a Knight \nCan you name him please?")
                let realname = name()
                count += 1 // to have 3 heroes by teams
                facto(count: count, personnage: Knight(name: realname))
                
            case "2":
                print("🤓: - You have selected a Wizard \nCan you name him please?")
                let realname = name()
                count += 1
                facto(count: count, personnage: Wizard(name: realname))

            case "3":
                print("🤓: - You have selected a Giant \nCan you name him please?")
                let realname = name()
                count += 1
                facto(count: count, personnage: Giant(name: realname))

            case "4":
                print("🤓: - You have selected a Dwarf \nCan you name him please?")
                let realname = name()
                count += 1
                facto(count: count, personnage: Dwarf(name: realname))

            default:
                print("🤓: - I don't understand, please select a number between 1 and 4 !")

            }
        }
    } while count < 3 // to have 3 heroes by teams
    print("🤓: - Your team is composed by \n")
    printTeam(currentTeam: currentTeam)
print("-----------------------------------------------------------------------------------------------------------------")
    
}

// NOT TO REPEAT
func facto(count: Int, personnage: Character) {
    
    if count == 1 { currentTeam.member1 = personnage}
    if count == 2 { currentTeam.member2 = personnage}
    if count == 3 { currentTeam.member3 = personnage}
    print("\n🤓: - Your \(personnage.type) is call \(personnage.name)")
print("-----------------------------------------------------------------------------------------------------------------")
    
}

// TO VERIFY THIS NAME IS NOT TAKEN
func name() -> String {
    var testname: String
    testname = readLine()!
    var test = false
    
    repeat{
        for names in charactersNames{ //to compare with each names already create
            test = false
            
            if names == testname{
                test = true
                print("🤓: - Already taken, please choose an other name")
                testname = readLine()!
            }
        }
        
    }while test == true // when test == false the names is unused so it can be return
    charactersNames.append(testname)
    return testname
}

// TO SELECT THE HEROE AND THE ENEMY
func selectCharacter(currentTeam: Team) -> Character{ //-func to select the heroe to play-
    var playerEntry : String?                       //-the heroe to heal-
    var selectedCharacter : Character?               //-and the enemy to fight
    var count2 = 0 // to be sure there is a good entry
    
    repeat{
        count2 = 1
        playerEntry = readLine()
        if let entry = playerEntry {
            switch entry {
            case "1" :
                selectedCharacter = currentTeam.member1
                print ("🤓: - You have chosen \(currentTeam.member1!.name) ")
                count2 = selectedCharacterlife(selectedCharacterLife: selectedCharacter!)
                
            case "2" :
                selectedCharacter = currentTeam.member2
                print ("🤓: - You have chosen  \(currentTeam.member2!.name) ")
                count2 = selectedCharacterlife(selectedCharacterLife: selectedCharacter!)
                
            case "3" :
                selectedCharacter = currentTeam.member3
                print("🤓: - You have chosen  \(currentTeam.member3!.name) ")
                count2 = selectedCharacterlife(selectedCharacterLife: selectedCharacter!)
             
            default :
                print("🤓: - This is not valid entry, try again")
                count2 = 0
            }

            }

        
    } while count2 == 0
    return selectedCharacter!
    
}

func selectedCharacterlife(selectedCharacterLife: Character) -> Int {
    if selectedCharacterLife.life <= 0 {
        print("🤓: - \(selectedCharacterLife.name)  is already dead , you have to choose another character")
   return 0
    
    }
return 1
}
// TO SHOW THE CURRENTTEAM MEMBERS
func printTeam(currentTeam: Team){ // to see all heroes , to select and all enemy to fight
    print("1 \(currentTeam.member1!.name) the \(currentTeam.member1!.type) with \(currentTeam.member1!.life) PV \n")
    print("2 \(currentTeam.member2!.name) the \(currentTeam.member2!.type) with \(currentTeam.member2!.life) PV \n")
    print("3 \(currentTeam.member3!.name) the \(currentTeam.member3!.type) with \(currentTeam.member3!.life) PV ")
}

// AFTER SELECT HEROE AND ENEMY
func fight(heroe: Character, enemy: Character){
    
    if heroe.type == "Wizard" {
        enemy.life += heroe.weapon.heal
        if enemy.life > enemy.fullLife { enemy.life = enemy.fullLife } // he can t have more life
    }
        
        
    else{
        enemy.life -= heroe.weapon.damage
    }
    
    if enemy.life < 0 { enemy.life = 0
        print("🤓: - This character is dead") // he can t have less life ...
    }
}



// WHEN ALL CHARACTERS OF TEAM 1 DIED RETURN FALSE
func testTeam1Life() -> Bool {
    let team1Life = team1.member1!.life + team1.member2!.life + team1.member3!.life
    if team1Life == 0 {

        return false
    }
    else {return true
    }
}

// WHEN ALL CHARACTERS OF TEAM 2 DIED RETURN FALSE
func testTeam2Life() -> Bool {
    let team2Life = team2.member1!.life + team2.member2!.life + team2.member3!.life
    if team2Life == 0 {

        return false
    }
    else {return true
    }
}

// THE TREASSURE WITH MAGICARROW AND MAGICSTICK, PROBABILITY 5%
func box() {
    
    if arc4random_uniform(101) > 95 { // the generate number is between 1 and 100
        print("🤓: - A treasure appears in front of you")
        if heroe.type == "wizard" {
            heroe.weapon = MagicStick()
            print("your wizard \(heroe.name) gets an overdrawing stick that can heal 50 PV by round!!!")
        }
        else {heroe.weapon = MagicArrow()
            print("\(heroe.name) the \(heroe.type) gets an overdrawing arrow that can remove 50 PV by round!!!")        }
    }
}

// BONUS FUNC, TO DETEMINATE THE BEGINNER
func randomBegin() {
    print("🤓: - The one who will have a better number will start the game")
    print("\n 🎲Team 1 , press a touch that will generate a random number between 1 and 100🎲")
    if readLine() != "" { print("\n 🎲The generate number is \(randomnumber1) ")
print("-----------------------------------------------------------------------------------------------------------------")    }
    
    sleep(2)
    print("\n 🎲Team 2 , press a touch that will generate a random number between 1 and 100🎲")
    if readLine() != "" { print("\n 🎲The generate number is \(randomnumber2) ")
print("-----------------------------------------------------------------------------------------------------------------")    }
    
    sleep(2)
    if randomnumber1 > randomnumber2 { print("🤓: - The team 1 will begin, that the best wins !!!")}
    else { print("🤓: - The team 2 will begin, that the best wins!!!")
        counter += 1
    }
}

// COMPOSED BY SELECTCHARACTERS ( HEROE AND ENEMY), BOX AND FIGHT
func central(){
    round += 1
    counter += 1
print("-----------------------------------------------------------------------------------------------------------------")
    print("                                       round \(round)")
sleep(2)
    if counter % 2 == 1 { // TO DETERMINATE THE PLAYER
print("-----------------------------------------------------------------------------------------------------------------")

        print("🤓: - Select your heroe Team1")
print("-----------------------------------------------------------------------------------------------------------------")
        printTeam(currentTeam: team1)
        heroe = selectCharacter(currentTeam: team1)
        
        if heroe.type == "Wizard"{ box()                                 // IF WIZARD  ENEMY = OUR TEAM
            repeat{
                print("🤓: - Choose an other character than yourself to heal")
                printTeam(currentTeam: team1)
                enemy = selectCharacter(currentTeam: team1)
                
            }while heroe.name == enemy.name }
            //TO NOT HEAL HIMSELF
        else{
print("-----------------------------------------------------------------------------------------------------------------")
sleep(2)
            box()
            print("🤓: - Select your target \n")
            printTeam(currentTeam: team2)
            enemy = selectCharacter(currentTeam: team2)}
    }
        
    else {
print("-----------------------------------------------------------------------------------------------------------------")
        print("🤓: - Select your heroe Team2")
print("-----------------------------------------------------------------------------------------------------------------")
        printTeam(currentTeam: team2)
        heroe = selectCharacter(currentTeam: team2)
        
        if heroe.type == "Wizard"{box()
            repeat{
                print("🤓: - Choose an other character than yourself to heal")
                printTeam(currentTeam: team2)
                enemy = selectCharacter(currentTeam: team2)
                
            }while heroe.name == enemy.name }
        else{
print("-----------------------------------------------------------------------------------------------------------------")
sleep(2)
            box()
            print("🤓: - Select your target \n")
            printTeam(currentTeam: team1)
            enemy = selectCharacter(currentTeam: team1)}
    }
    fight(heroe: heroe, enemy: enemy)
    if heroe.type == "Wizard"{print("🤓: - \(heroe.name) heal with his \(heroe.weapon.name) that add \(heroe.weapon.heal) to \(enemy.name)")
        print("\(enemy.name) have now \(enemy.life)PV")
    }
    else{print("🤓: - \(heroe.name) attack with his \(heroe.weapon.name) that cost \(heroe.weapon.damage) to \(enemy.name)")
        print("\(enemy.name) have now \(enemy.life)PV")}
    dragonBorn()
}

// AT THE END TO SHOW THE WINNER
func printWinner(){
print("-----------------------------------------------------------------------------------------------------------------")
    print("                              🤓: -  The game last \(round)")
    if testTeam1Life() == false {
    print("                                     ☠️Team1 has lost☠️")
    print("                                     👑Team2 wins, Congratulations!!!👑") }
   else{
    print("                                     ☠️Team2 has lost☠️")
    print("                                     👑Team1 wins, Congratulation!!!👑")}
print("-----------------------------------------------------------------------------------------------------------------")}


// BONUS FUNC , THE DRAGON HAVE 1 CHANCE ON 2 TO HIT A RANDOM HEROE ALIVE
func dragonBorn(){
    if testTeam1Life() == true && testTeam2Life() == true {
    let dragon: Int = Int(arc4random_uniform(101))
 
    var dragoncount = 0
print("-----------------------------------------------------------------------------------------------------------------")
    
    if dragon >= 50{
        repeat{
        let dragonTarget: Int = Int(arc4random_uniform(6)) + 1
        switch dragonTarget{
        case 1: target = team1.member1!
        case 2: target = team1.member2!
        case 3: target = team1.member3!
        case 4: target = team2.member1!
        case 5: target = team2.member2!
        case 6: target = team2.member3!
        default: print("error")
            }
        if target.life > 0 { dragoncount += 1}
        }while dragoncount < 1
        
        sleep(2)
        target.life -= 20
        print("                             🤓: - You've made too many noises!!!")
        sleep(1)
        print("                                   The dragon wake up, and he is so Angry")
        sleep(1)
        print("                                   He spits flames everywhere!!!")
        sleep(1)
        print("                                   \(target.name) is hit by the flames, he lost 20PV")
        if target.life < 0 {target.life = 0}
        print("                                   He has now \(target.life)PV")
    }
if dragon < 50
        {
sleep(2)
    print("                                  🤓: - You have been pretty quiet!!")
    sleep(1)
    print("                                        The dragon doesn't wake up")
    }
    
}
}





