local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon

UEB3304 = ClassUnit(TStructureUnit) {
    Weapons = {
        AAGun = ClassWeapon(TAAFlakArtilleryCannon) {},
    },
}

TypeClass = UEB3304