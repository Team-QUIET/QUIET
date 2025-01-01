local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher

WEL0309 = ClassUnit(TLandUnit) {
    Weapons = {
        AA = ClassWeapon(TSAMLauncher) {
        }
    },
}

TypeClass = WEL0309