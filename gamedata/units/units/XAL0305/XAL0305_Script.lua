local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local ADFHeavyDisruptorCannonWeapon = import('/lua/aeonweapons.lua').ADFHeavyDisruptorCannonWeapon

XAL0305 = ClassUnit(AWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFHeavyDisruptorCannonWeapon) {}
    },
}

TypeClass = XAL0305