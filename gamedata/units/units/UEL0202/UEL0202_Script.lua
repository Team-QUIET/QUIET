local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

UEL0202 = ClassUnit(TLandUnit) {
    Weapons = {
        FrontTurret01 = ClassWeapon(TDFGaussCannonWeapon) {}
    },
}

TypeClass = UEL0202