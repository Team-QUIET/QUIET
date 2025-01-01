local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit

local SDFAireauBolterWeapon = import('/lua/seraphimweapons.lua').SDFAireauBolterWeapon

XSL0202 = ClassUnit(SWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(SDFAireauBolterWeapon) {}
    },
}
TypeClass = XSL0202