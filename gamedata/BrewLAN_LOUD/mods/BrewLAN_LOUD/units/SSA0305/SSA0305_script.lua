local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SDFPhasicAutoGunWeapon = import('/lua/seraphimweapons.lua').SDFPhasicAutoGunWeapon
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeaponAirUnit

SSA0305 = ClassUnit(SAirUnit) {
    Weapons = {
        AutoCannon1 = ClassWeapon(SAALosaareAutoCannonWeapon) {},
        TurretLeft = ClassWeapon(SDFPhasicAutoGunWeapon) {},
        TurretRight = ClassWeapon(SDFPhasicAutoGunWeapon) {},
    },
}
TypeClass = SSA0305
