local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TDFGaussCannonWeapon  = WeaponsFile.TDFLandGaussCannonWeapon
local TAMPhalanxWeapon      = WeaponsFile.TAMPhalanxWeapon

WeaponsFile = nil

BRNT2BM = ClassUnit(TWalkingLandUnit) {

    Weapons = {
	
        rocket = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.3 },
        gatling = ClassWeapon(TAMPhalanxWeapon) { FxMuzzleFlashScale = 0.25 },

    },
}

TypeClass = BRNT2BM