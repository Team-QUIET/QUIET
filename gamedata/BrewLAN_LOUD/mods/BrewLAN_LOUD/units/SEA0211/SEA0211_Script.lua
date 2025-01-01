local TAirUnit = import('/lua/defaultunits.lua').AirUnit

local TIFSmallYieldNuclearBombWeapon = import('/lua/terranweapons.lua').TIFSmallYieldNuclearBombWeapon
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun

SEA0211 = ClassUnit(TAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(TIFSmallYieldNuclearBombWeapon) {},
        LinkedRailGun = ClassWeapon(TAALinkedRailgun) {},
    },
}

TypeClass = SEA0211
