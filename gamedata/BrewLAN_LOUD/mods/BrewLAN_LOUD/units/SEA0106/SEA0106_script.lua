--------------------------------------------------------------------------------
--  Summary  :  UEF Torpedo Bomber Script
--------------------------------------------------------------------------------
local TAirUnit = import('/lua/defaultunits.lua').AirUnit
local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler

SEA0106 = ClassUnit(TAirUnit) {
    Weapons = {
        Torpedo = ClassWeapon(TANTorpedoAngler) {},
    },
}

TypeClass = SEA0106
