local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

UEL0108 = ClassUnit(TLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(TDFGaussCannonWeapon) {}
    },
}
TypeClass = UEL0108