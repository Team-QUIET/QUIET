local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local AWeapons = import('/lua/aeonweapons.lua')

local ADFLaserHighIntensityWeapon   = AWeapons.ADFLaserHighIntensityWeapon
local ADFCannonOblivionWeapon       = AWeapons.ADFCannonOblivionWeapon
local ADFQuantumAutogunWeapon       = AWeapons.ADFQuantumAutogunWeapon
local AAAZealotMissileWeapon        = AWeapons.AAAZealotMissileWeapon

AWeapons = nil

WAL4404 = ClassUnit(AWalkingLandUnit) {

    Weapons = {
    
        ChinGun     = ClassWeapon(ADFLaserHighIntensityWeapon) {},
        
		Arm         = ClassWeapon(ADFCannonOblivionWeapon) {},  

		TopCannon   = ClassWeapon(ADFQuantumAutogunWeapon) {},
        
		AAMissile   = ClassWeapon(AAAZealotMissileWeapon) {},
    }, 
}

TypeClass = WAL4404