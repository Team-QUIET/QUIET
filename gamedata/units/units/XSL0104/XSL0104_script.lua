local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SAAShleoCannonWeapon = import('/lua/seraphimweapons.lua').SAAShleoCannonWeapon

XSL0104 = ClassUnit(SWalkingLandUnit) {

    Weapons = {
	
        AAGun = ClassWeapon(SAAShleoCannonWeapon) {},
		
    },
	
}

TypeClass = XSL0104