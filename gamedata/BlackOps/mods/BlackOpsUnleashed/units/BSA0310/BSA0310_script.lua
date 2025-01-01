local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SLaanseMissileWeapon  = import('/lua/seraphimweapons.lua').SLaanseMissileWeapon
local SDFThauCannon         = import('/lua/seraphimweapons.lua').SDFThauCannon

BSA0310 = ClassUnit(SAirUnit) {

    Weapons = {
    	Missile     = ClassWeapon(SLaanseMissileWeapon) {},
        GunTurret   = ClassWeapon(SDFThauCannon) {},
    },
}
TypeClass = BSA0310