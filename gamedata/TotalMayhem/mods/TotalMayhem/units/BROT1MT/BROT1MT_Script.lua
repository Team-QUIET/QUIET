local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon

BROT1MT = ClassUnit(TLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(AAASonicPulseBatteryWeapon) {},
    },
}

TypeClass = BROT1MT