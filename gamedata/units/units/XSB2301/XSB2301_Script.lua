local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SDFUltraChromaticBeamGenerator = import('/lua/seraphimweapons.lua').SDFUltraChromaticBeamGenerator

XSB2301 = ClassUnit(SStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(SDFUltraChromaticBeamGenerator) {}
    },
}

TypeClass = XSB2301