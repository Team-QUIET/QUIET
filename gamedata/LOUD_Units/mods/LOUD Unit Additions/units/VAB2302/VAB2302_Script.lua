local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon

VAB2302 = ClassUnit(AStructureUnit) {

    Weapons = {
	
        AntiAirMissiles = ClassWeapon(AAAZealotMissileWeapon) {},
		
    }
	
}

TypeClass = VAB2302