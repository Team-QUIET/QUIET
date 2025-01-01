local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SAAOlarisCannonWeapon = import('/lua/seraphimweapons.lua').SAAOlarisCannonWeapon

XSL0205 = ClassUnit(SLandUnit) {
    Weapons = {
        AAGun = ClassWeapon(SAAOlarisCannonWeapon) {},
    },
}
TypeClass = XSL0205