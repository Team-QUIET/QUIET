local AHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon

UAL0101 = ClassUnit(AHoverLandUnit) {
    Weapons = {
        LaserTurret = ClassWeapon(ADFLaserLightWeapon) {}
    },
}

TypeClass = UAL0101