local TAirUnit = import('/lua/defaultunits.lua').AirUnit

local TAAGinsuRapidPulseWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

UEA0303 = ClassUnit(TAirUnit) {
    Weapons = {
        Beam = ClassWeapon(TAAGinsuRapidPulseWeapon) {},
    },
}

TypeClass = UEA0303