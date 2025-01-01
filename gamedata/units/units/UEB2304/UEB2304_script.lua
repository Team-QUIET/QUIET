local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher

UEB2304 = ClassUnit(TStructureUnit) {
    Weapons = {
        AAMissileRack = ClassWeapon(TSAMLauncher) {},
    },
}

TypeClass = UEB2304