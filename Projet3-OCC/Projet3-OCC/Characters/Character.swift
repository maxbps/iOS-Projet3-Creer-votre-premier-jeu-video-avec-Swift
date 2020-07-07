class Character {
    var type: String
    var name: String
    var life: Int
    var weapon: Weapon
    var fullLife: Int
    
    
    
    init(type: String, name: String, weapon: Weapon, life: Int, fullLife: Int) {
        self.type = type
        self.name = name
        self.weapon = weapon
        self.life = life
        self.fullLife = fullLife
        
    }
    
}

