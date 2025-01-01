local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SAALosaareAutoCannonWeapon    = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeapon
local SAMElectrumMissileDefense     = import('/lua/seraphimweapons.lua').SAMElectrumMissileDefense

SSL0320 = ClassUnit(SLandUnit) {

    Weapons = {
        AntiMissile     = ClassWeapon(SAMElectrumMissileDefense) {},
        AAMissiles      = ClassWeapon(SAALosaareAutoCannonWeapon) {},
    },

}

TypeClass = SSL0320
