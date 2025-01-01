local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SLaanseMissileWeapon = import('/lua/seraphimweapons.lua').SLaanseMissileWeapon

XSB2108 = ClassUnit(SStructureUnit) {
    Weapons = {
        CruiseMissile = ClassWeapon(SLaanseMissileWeapon) {},
    },
}
TypeClass = XSB2108
