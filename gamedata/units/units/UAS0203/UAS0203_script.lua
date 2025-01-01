local ASubUnit =  import('/lua/defaultunits.lua').SubUnit

local AANChronoTorpedoWeapon = import('/lua/aeonweapons.lua').AANChronoTorpedoWeapon

UAS0203 = ClassUnit(ASubUnit) {

    Weapons = {
        Torpedo = ClassWeapon(AANChronoTorpedoWeapon) {},
    },
	
}

TypeClass = UAS0203