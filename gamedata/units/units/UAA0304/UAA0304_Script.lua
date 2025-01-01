local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AIFBombQuarkWeapon = import('/lua/aeonweapons.lua').AIFBombQuarkWeapon

UAA0304 = ClassUnit(AAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(AIFBombQuarkWeapon) {},
    },
}

TypeClass = UAA0304