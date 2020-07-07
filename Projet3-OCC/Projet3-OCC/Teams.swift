class Team {
    var teamName: String
    var member1: Character? = nil
    var member2: Character? = nil
    var member3: Character? = nil
    
    
    init(teamName: String) {
        self.teamName = teamName
    }
    
    func printName() {
        print("\(self.teamName)")
    }
}
