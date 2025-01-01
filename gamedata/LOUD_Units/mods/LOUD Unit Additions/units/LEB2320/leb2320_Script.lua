local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

LEB2320 = ClassUnit(TStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(TIFArtilleryWeapon) {},
        MainGun1 = ClassWeapon(TIFArtilleryWeapon) {},
        MainGun2 = ClassWeapon(TIFArtilleryWeapon) {},
    },
}

TypeClass = LEB2320