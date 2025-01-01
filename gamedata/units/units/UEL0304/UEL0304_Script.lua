local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

UEL0304 = ClassUnit(TLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(TIFArtilleryWeapon) {
        }
    },
}

TypeClass = UEL0304