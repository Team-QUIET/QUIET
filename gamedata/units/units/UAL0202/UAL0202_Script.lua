local ALandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFCannonQuantumWeapon = import('/lua/aeonweapons.lua').ADFCannonQuantumWeapon

UAL0202 = ClassUnit(ALandUnit) {

    Weapons = {
        MainGun = ClassWeapon(ADFCannonQuantumWeapon) {}
    },
    
}
TypeClass = UAL0202