local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SIFBombZhanaseeWeapon = import('/lua/seraphimweapons.lua').SIFBombZhanaseeWeapon

XSA0304 = ClassUnit(SAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(SIFBombZhanaseeWeapon) {},
    },
}
TypeClass = XSA0304