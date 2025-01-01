local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeaponAirUnit

BRPAT2FIGBO = ClassUnit(SAirUnit) {

    Weapons = {
        MainGun = ClassWeapon(SAALosaareAutoCannonWeapon) {},
    },
}

TypeClass = BRPAT2FIGBO
