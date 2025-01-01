local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CIFNaniteTorpedoWeapon = import('/lua/cybranweapons.lua').CIFNaniteTorpedoWeapon

URA0204 = ClassUnit(CAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(CIFNaniteTorpedoWeapon) {},
    },
	
}

TypeClass = URA0204