local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon

UAA0102 = ClassUnit(AAirUnit) {

    Weapons = {
        SonicPulseBattery = ClassWeapon(AAASonicPulseBatteryWeapon) {	FxMuzzleFlash = {'/effects/emitters/sonic_pulse_muzzle_flash_02_emit.bp' } },
    }, 
}

TypeClass = UAA0102