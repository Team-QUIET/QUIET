local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SDFBombOtheWeapon = import('/lua/seraphimweapons.lua').SDFBombOtheWeapon

XSA0103 = ClassUnit(SAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(SDFBombOtheWeapon) {},
    },
}

TypeClass = XSA0103