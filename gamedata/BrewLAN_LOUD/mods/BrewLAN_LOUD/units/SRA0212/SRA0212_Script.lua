local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CAAAutocannon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

SRA0102 = ClassUnit(CAirUnit) {
    Weapons = {
        AutoCannon = ClassWeapon(CAAAutocannon) {},
    },
}

TypeClass = SRA0102
