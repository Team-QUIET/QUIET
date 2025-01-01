local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AANChronoTorpedoWeapon = import('/lua/aeonweapons.lua').AANChronoTorpedoWeapon

SAA0106 = ClassUnit(AAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(AANChronoTorpedoWeapon) { FxMuzzleFlash = false },
    },
}

TypeClass = SAA0106
