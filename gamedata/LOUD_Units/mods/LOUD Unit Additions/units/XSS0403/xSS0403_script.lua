local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit

local SeraphimWeapons = import('/lua/seraphimweapons.lua')

local SAALosaareAutoCannonWeapon = SeraphimWeapons.SAALosaareAutoCannonWeapon
local SDFExperimentalPhasonProj = SeraphimWeapons.SDFExperimentalPhasonProj
local SAMElectrumMissileDefense = SeraphimWeapons.SAMElectrumMissileDefense

SeraphimWeapons = nil

XSS0403 = ClassUnit(SSeaUnit) {

    Weapons = {
	
		AAGun = ClassWeapon(SAALosaareAutoCannonWeapon) {},

        GroundGun = ClassWeapon(SDFExperimentalPhasonProj) {},

		TMD = ClassWeapon(SAMElectrumMissileDefense) {},
    },

}

TypeClass = XSS0403
