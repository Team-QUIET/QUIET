local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CIFNaniteTorpedoWeapon = import('/lua/cybranweapons.lua').CIFNaniteTorpedoWeapon

SRA0106 = ClassUnit(CAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(CIFNaniteTorpedoWeapon) {},
    },
    
}
TypeClass = SRA0106
