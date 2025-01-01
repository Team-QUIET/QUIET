local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TIFStrategicMissileWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

UEB2305 = ClassUnit(TStructureUnit) {
    Weapons = {
        NukeMissiles = ClassWeapon(TIFStrategicMissileWeapon) {},
    },
}

TypeClass = UEB2305
