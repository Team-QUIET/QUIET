local CSubUnit =  import('/lua/defaultunits.lua').SubUnit

local CybranWeapons = import('/lua/cybranweapons.lua')

local CIFMissileLoaWeapon       = CybranWeapons.CIFMissileLoaWeapon
local CIFMissileStrategicWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CANTorpedoLauncherWeapon  = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

CybranWeapons = nil

URS0304 = ClassUnit(CSubUnit) {

    Weapons = {
        NukeMissiles = ClassWeapon(CIFMissileStrategicWeapon){},
        CruiseMissile = ClassWeapon(CIFMissileLoaWeapon){},
        Torpedo = ClassWeapon(CANTorpedoLauncherWeapon){},
    },

}

TypeClass = URS0304

