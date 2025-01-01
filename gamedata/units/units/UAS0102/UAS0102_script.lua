local ASeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon

UAS0102 = ClassUnit(ASeaUnit) {

    Weapons = {
        AAGun = ClassWeapon(AAASonicPulseBatteryWeapon) {},
    },
    
}

TypeClass = UAS0102