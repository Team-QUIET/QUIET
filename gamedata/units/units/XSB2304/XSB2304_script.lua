local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeapon

XSB2304 = ClassUnit(SStructureUnit) {
    Weapons = {
        AutoCannon = ClassWeapon(SAALosaareAutoCannonWeapon) {},
    },
}

TypeClass = XSB2304