local SStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local SDFAireauWeapon = import ('/lua/seraphimweapons.lua').SDFAireauWeapon

SSB2306 = ClassUnit(SStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(SDFAireauWeapon) {},
    },
}

TypeClass = SSB2306
