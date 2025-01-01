local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CIFArtilleryWeapon = import('/lua/cybranweapons.lua').CIFArtilleryWeapon

LRB2320 = ClassUnit(CStructureUnit) {
   
    Weapons = {
        gun     = ClassWeapon(CIFArtilleryWeapon) { FxMuzzleFlashScale = 0.2 },
        gun1    = ClassWeapon(CIFArtilleryWeapon) { FxMuzzleFlashScale = 0.2 },
        gun2    = ClassWeapon(CIFArtilleryWeapon) { FxMuzzleFlashScale = 0.2 },
    },
}

TypeClass = LRB2320