local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon

VSB2302 = ClassUnit(SStructureUnit) {

    Weapons = {
	
        AntiAirMissiles = ClassWeapon(AAAZealotMissileWeapon) {},
		
    },
	
}

TypeClass = VSB2302