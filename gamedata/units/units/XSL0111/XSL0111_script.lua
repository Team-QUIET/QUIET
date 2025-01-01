local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SLaanseMissileWeapon = import('/lua/seraphimweapons.lua').SLaanseMissileWeapon

XSL0111 = ClassUnit(SLandUnit) {

    Weapons = {
        MissileRack = ClassWeapon(SLaanseMissileWeapon) {},
    },
}
TypeClass = XSL0111