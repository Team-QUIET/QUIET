local ALandUnit = import('/lua/defaultunits.lua').MobileUnit

local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon

UAL0104 = ClassUnit(ALandUnit) {

    Weapons = {
        AAGun = ClassWeapon(AAASonicPulseBatteryWeapon) {},
    },
}

TypeClass = UAL0104