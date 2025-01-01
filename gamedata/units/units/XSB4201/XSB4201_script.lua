local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SAMElectrumMissileDefense = import('/lua/seraphimweapons.lua').SAMElectrumMissileDefense

XSB4201 = ClassUnit(SStructureUnit) {
    Weapons = {
        AntiMissile = ClassWeapon(SAMElectrumMissileDefense) {},
    },
}

TypeClass = XSB4201

