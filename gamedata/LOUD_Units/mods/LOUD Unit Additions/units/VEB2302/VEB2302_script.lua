local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher

VEB2302 = ClassUnit(TStructureUnit) {

    Weapons = {
       MissileRack01 = ClassWeapon(TSAMLauncher) {},
    },

}

TypeClass = VEB2302