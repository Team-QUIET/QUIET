local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AIFBombGravitonWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

UAA0103 = ClassUnit(AAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(AIFBombGravitonWeapon) {},
    },
}

TypeClass = UAA0103

