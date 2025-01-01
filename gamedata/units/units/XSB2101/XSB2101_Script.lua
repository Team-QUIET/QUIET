local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SDFOhCannon = import('/lua/seraphimweapons.lua').SDFOhCannon

XSB2101 = ClassUnit(SStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(SDFOhCannon) {},
    },
}
TypeClass = XSB2101