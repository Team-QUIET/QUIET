local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AIFBombQuarkWeapon = import('/lua/aeonweapons.lua').AIFBombQuarkWeapon

SAA0211 = ClassUnit(AAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(AIFBombQuarkWeapon) {},
    },
}

TypeClass = SAA0211
