class Wizard: Character {
    
    init(name: String){
        super.init(type: "Wizard", name: name, weapon: Stick(), life: WIZARDLIFE, fullLife: WIZARDFULLLIFE)
    }
}
