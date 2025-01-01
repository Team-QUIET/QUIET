local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SDFOhCannon = import('/lua/seraphimweapons.lua').SDFOhCannon

XSL0201 = ClassUnit(SLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(SDFOhCannon) {}
    },
}
TypeClass = XSL0201
