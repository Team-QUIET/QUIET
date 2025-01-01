local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local TIFCommanderDeathWeapon   = import('/lua/terranweapons.lua').TIFCommanderDeathWeapon
local TDFGaussCannonWeapon      = import('/lua/terranweapons.lua').TDFLandGaussCannonWeapon
local MicrowaveLaser            = import('/lua/cybranweapons.lua').CDFHeavyMicrowaveLaserGeneratorCom

local AIFBallisticMortarFlash02 = import('/lua/EffectTemplates.lua').AIFBallisticMortarFlash02

BROT3SHBM = ClassUnit(AWalkingLandUnit) {

    Weapons = {

        MainGun     = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 1.5, FxMuzzleFlash = AIFBallisticMortarFlash02 },
		
        Laser       = ClassWeapon(MicrowaveLaser) {},
		
        EMPgun      = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0 },
		
        robottalk   = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0 },
    }, 
    
}
TypeClass = BROT3SHBM