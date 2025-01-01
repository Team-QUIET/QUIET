local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SAAShleoCannonWeapon = import('/lua/seraphimweapons.lua').SAAShleoCannonWeapon

XSA0102 = ClassUnit(SAirUnit) {
    Weapons = {
        SonicPulseBattery = ClassWeapon(SAAShleoCannonWeapon) {},
    },
}

TypeClass = XSA0102