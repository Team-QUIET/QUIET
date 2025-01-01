local AHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

BROT1BT = ClassUnit(AHoverLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.4},
    },
}

TypeClass = BROT1BT