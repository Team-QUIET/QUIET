local SAirUnit = import('/lua/defaultunits.lua').AirUnit
local SAALosaareAutoCannonWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

XSA0303 = ClassUnit(SAirUnit) {
    Weapons = {
        AutoCannon1 = ClassWeapon(SAALosaareAutoCannonWeapon) {},
    },
}

TypeClass = XSA0303