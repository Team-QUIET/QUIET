local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AANChronoTorpedoWeapon = import('/lua/aeonweapons.lua').AANChronoTorpedoWeapon


UAA0204 = ClassUnit(AAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(AANChronoTorpedoWeapon) { FxMuzzleFlash = false },
    },
}

TypeClass = UAA0204