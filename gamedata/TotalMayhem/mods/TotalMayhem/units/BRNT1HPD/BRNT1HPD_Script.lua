local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFLandGaussCannonWeapon

BRNT2PD2 = ClassUnit(TStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.4 },
    },
}

TypeClass = BRNT2PD2