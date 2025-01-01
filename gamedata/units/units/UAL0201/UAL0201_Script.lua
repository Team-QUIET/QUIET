local AHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFDisruptorCannonWeapon = import('/lua/aeonweapons.lua').ADFDisruptorCannonWeapon

UAL0201 = ClassUnit(AHoverLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFDisruptorCannonWeapon) {}
    },
}
TypeClass = UAL0201

