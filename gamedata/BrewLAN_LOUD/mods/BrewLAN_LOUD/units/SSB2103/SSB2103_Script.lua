local SStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local SIFZthuthaamArtilleryCannon = import('/lua/seraphimweapons.lua').SIFZthuthaamArtilleryCannon

SSB2103 = ClassUnit(SStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(SIFZthuthaamArtilleryCannon) {},
    },
}

TypeClass = SSB2103
