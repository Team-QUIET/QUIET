local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFShipGaussCannonWeapon = import('/lua/terranweapons.lua').TDFShipGaussCannonWeapon

SEB2401 = ClassUnit(TStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(TDFShipGaussCannonWeapon){
            FxMuzzleFlash = {},
        },
    },
}
TypeClass = SEB2401
