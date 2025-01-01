local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SDFPhasicAutoGunWeapon = import('/lua/seraphimweapons.lua').SDFPhasicAutoGunWeapon

XSA0203 = ClassUnit(SAirUnit) {

    Weapons = {
        Turret = ClassWeapon(SDFPhasicAutoGunWeapon) {},
    },
	
}

TypeClass = XSA0203