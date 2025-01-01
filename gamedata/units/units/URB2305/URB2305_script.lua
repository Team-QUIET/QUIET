local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CIFMissileStrategicWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

URB2305 = ClassUnit(CStructureUnit) {
    Weapons = {
        NukeMissiles = ClassWeapon(CIFMissileStrategicWeapon) {},
    },
    
}

TypeClass = URB2305
