local SHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SIFThunthoCannonWeapon = import('/lua/seraphimweapons.lua').SIFThunthoCannonWeapon

XSL0103 = ClassUnit(SHoverLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(SIFThunthoCannonWeapon) {}
    },
}

TypeClass = XSL0103