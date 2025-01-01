local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TAMInterceptorWeapon = import('/lua/terranweapons.lua').TAMInterceptorWeapon

SEL0321 = ClassUnit(TLandUnit) {

    Weapons = {
        AntiMissile = ClassWeapon(TAMInterceptorWeapon) {},
    },
    
}

TypeClass = SEL0321
