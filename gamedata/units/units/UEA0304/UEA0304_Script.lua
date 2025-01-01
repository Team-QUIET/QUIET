local TAirUnit = import('/lua/defaultunits.lua').AirUnit

local TIFSmallYieldNuclearBombWeapon = import('/lua/terranweapons.lua').TIFSmallYieldNuclearBombWeapon
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun

UEA0304 = ClassUnit(TAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(TIFSmallYieldNuclearBombWeapon) {},
        LinkedRailGun1 = ClassWeapon(TAALinkedRailgun) {},
    },
}

TypeClass = UEA0304
