local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AAAAutocannonQuantumWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

UAA0303 = ClassUnit(AAirUnit) {
    Weapons = {
        AutoCannon1 = ClassWeapon(AAAAutocannonQuantumWeapon) {},
    },
}

TypeClass = UAA0303