local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

UEL0201 = ClassUnit(TLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(TDFGaussCannonWeapon) {},
    },
}

TypeClass = UEL0201