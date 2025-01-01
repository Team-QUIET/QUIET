local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SIFZthuthaamArtilleryCannon = import('/lua/seraphimweapons.lua').SIFZthuthaamArtilleryCannon

XSB2303 = ClassUnit(SStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(SIFZthuthaamArtilleryCannon) {},
    },
}

TypeClass = XSB2303