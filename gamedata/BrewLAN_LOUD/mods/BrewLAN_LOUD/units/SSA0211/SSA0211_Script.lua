local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SIFBombZhanaseeWeapon = import('/lua/seraphimweapons.lua').SIFBombZhanaseeWeapon

SSA0211 = ClassUnit(SAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(SIFBombZhanaseeWeapon) {},
    },
}

TypeClass = SSA0211
