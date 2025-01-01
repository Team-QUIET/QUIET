local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon

UEB2204 = ClassUnit(TStructureUnit) {
    Weapons = {
        AAGun = ClassWeapon(TAAFlakArtilleryCannon) {},
    },
}

TypeClass = UEB2204