local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

UEB2301 = ClassUnit(TStructureUnit) {
    Weapons = {
        Gauss01 = ClassWeapon(TDFGaussCannonWeapon) {},      
    },
}

TypeClass = UEB2301