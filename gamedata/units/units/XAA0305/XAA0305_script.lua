local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon
local AAAZealot02MissileWeapon = import('/lua/aeonweapons.lua').AAAZealot02MissileWeapon

XAA0305 = ClassUnit(AAirUnit) {

    Weapons = {
        Turret = ClassWeapon(ADFLaserLightWeapon) {},
        AAGun = ClassWeapon(AAAZealot02MissileWeapon) {},
    },
	
}

TypeClass = XAA0305