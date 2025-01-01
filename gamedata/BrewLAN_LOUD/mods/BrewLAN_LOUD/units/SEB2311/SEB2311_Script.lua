local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFShipGaussCannonWeapon = import('/lua/terranweapons.lua').TDFShipGaussCannonWeapon

SEB2311 = ClassUnit(TStructureUnit) {
    Weapons = {
        FrontTurret02 = ClassWeapon(TDFShipGaussCannonWeapon) {},
    },
}

TypeClass = SEB2311
