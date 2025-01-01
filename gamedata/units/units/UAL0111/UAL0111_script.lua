local ALandUnit = import('/lua/defaultunits.lua').MobileUnit

local AIFMissileTacticalSerpentineWeapon = import('/lua/aeonweapons.lua').AIFMissileTacticalSerpentineWeapon

UAL0111 = ClassUnit(ALandUnit) {
    Weapons = {
        MissileRack = ClassWeapon(AIFMissileTacticalSerpentineWeapon) {},
    },
}

TypeClass = UAL0111