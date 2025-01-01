local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SANHeavyCavitationTorpedo = import('/lua/seraphimweapons.lua').SANHeavyCavitationTorpedo

XSA0204 = ClassUnit(SAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(SANHeavyCavitationTorpedo) {},
    },
	
}

TypeClass = XSA0204