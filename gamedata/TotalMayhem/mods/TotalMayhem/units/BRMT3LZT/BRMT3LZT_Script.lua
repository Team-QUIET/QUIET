local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CDFHeavyDisintegratorWeapon = import('/lua/cybranweapons.lua').CDFHeavyDisintegratorWeapon

BRMT3LZT = ClassUnit(TLandUnit) {

    Weapons = {
        MainGun = ClassWeapon(CDFHeavyDisintegratorWeapon) {},
    },
}

TypeClass = BRMT3LZT