local SSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local SeraphimWeapons = import('/lua/seraphimweapons.lua')

local SLaanseMissileWeapon      = SeraphimWeapons.SLaanseMissileWeapon
local SAAOlarisCannonWeapon     = SeraphimWeapons.SAAOlarisCannonWeapon
local SAAShleoCannonWeapon      = SeraphimWeapons.SAAShleoCannonWeapon
local SAMElectrumMissileDefense = SeraphimWeapons.SAMElectrumMissileDefense

SeraphimWeapons = nil

XSS0202 = ClassUnit(SSeaUnit) {
    Weapons = {
        Missile         = ClassWeapon(SLaanseMissileWeapon) {},
		RightAAGun      = ClassWeapon(SAAShleoCannonWeapon) {},
		LeftAAGun       = ClassWeapon(SAAOlarisCannonWeapon) {},
        AntiMissile     = ClassWeapon(SAMElectrumMissileDefense) {},
    },

}

TypeClass = XSS0202