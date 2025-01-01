local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TSAMLauncher          = import('/lua/terranweapons.lua').TSAMLauncher
local TDFGaussCannonWeapon  = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

XEL0308 = ClassUnit(TLandUnit) {
    Weapons = {
        MissileRack01 = ClassWeapon(TSAMLauncher) {},
        MainGun = ClassWeapon(TDFGaussCannonWeapon) {}
    },
}
TypeClass = XEL0308