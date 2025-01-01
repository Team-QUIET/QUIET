local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit

local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon

UEL0101 = ClassUnit(TConstructionUnit) {
    
    Weapons = {
        MainGun = ClassWeapon(TDFMachineGunWeapon) {
        },
    },

}


TypeClass = UEL0101
