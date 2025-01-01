local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFLandGaussCannonWeapon

BROT3PDRO = ClassUnit(TStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.6 },
    },
}

TypeClass = BROT3PDRO