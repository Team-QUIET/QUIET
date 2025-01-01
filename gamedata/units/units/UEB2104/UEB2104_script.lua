local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun

UEB2104 = ClassUnit(TStructureUnit) {

    Weapons = {
        AAGun = ClassWeapon(TAALinkedRailgun) {},
    },
	
}

TypeClass = UEB2104
