local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SAAOlarisCannonWeapon = import('/lua/seraphimweapons.lua').SAAOlarisCannonWeapon

XSB3304 = ClassUnit(SStructureUnit) {
    Weapons = {
        AAFizz = ClassWeapon(SAAOlarisCannonWeapon) {},
    },
}
TypeClass = XSB3304