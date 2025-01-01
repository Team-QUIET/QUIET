local TAirUnit = import('/lua/defaultunits.lua').AirUnit

local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler


UEA0204 = ClassUnit(TAirUnit) {

    Weapons = {
	
        Torpedo = ClassWeapon(TANTorpedoAngler) {},
		
    },
	
}

TypeClass = UEA0204