local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SAAOlarisCannonWeapon = import('/lua/seraphimweapons.lua').SAAOlarisCannonWeapon

XSB2204 = ClassUnit(SStructureUnit) {
    Weapons = {
        AAFizz = ClassWeapon(SAAOlarisCannonWeapon) {},
    },
}
TypeClass = XSB2204