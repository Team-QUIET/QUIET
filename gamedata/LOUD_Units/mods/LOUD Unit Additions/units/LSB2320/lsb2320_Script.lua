local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SIFZthuthaamArtilleryCannon = import('/lua/seraphimweapons.lua').SIFZthuthaamArtilleryCannon

LSB2320 = ClassUnit(SStructureUnit) {

    Weapons = {
        MainGun     = ClassWeapon(SIFZthuthaamArtilleryCannon) {},
        MainGun1    = ClassWeapon(SIFZthuthaamArtilleryCannon) {},
        MainGun2    = ClassWeapon(SIFZthuthaamArtilleryCannon) {},
    },
}

TypeClass = LSB2320