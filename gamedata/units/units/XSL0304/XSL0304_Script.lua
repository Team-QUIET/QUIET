local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit

local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon

XSL0304 = ClassUnit(SWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(SIFSuthanusArtilleryCannon) {}
    },
 
}

TypeClass = XSL0304