local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFShipGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

SEB2211 = ClassUnit(TStructureUnit) {
    Weapons = {
        Turret = ClassWeapon(TDFShipGaussCannonWeapon) {},
    },
}

TypeClass = SEB2211
