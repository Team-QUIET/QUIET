local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local WeaponsFile = import('/lua/cybranweapons.lua')

local CDFProtonCannonWeapon     = WeaponsFile.CDFProtonCannonWeapon
local CDFParticleCannonWeapon   = WeaponsFile.CDFParticleCannonWeapon

WeaponsFile = nil

BRMT2MEDM = ClassUnit(CWalkingLandUnit) {

    Weapons = {
	
        MainGun = ClassWeapon(CDFParticleCannonWeapon) {},
		
        ParticleMortar1 = ClassWeapon(CDFProtonCannonWeapon) { FxMuzzleFlashScale = 0.3 },
    },
}

TypeClass = BRMT2MEDM