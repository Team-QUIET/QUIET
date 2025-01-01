local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local WeaponsFile = import('/lua/terranweapons.lua')

local EffectTemplate = import('/lua/EffectTemplates.lua')

local TSAMLauncher                  = WeaponsFile.TSAMLauncher
local TDFLightPlasmaCannonWeapon    = WeaponsFile.TDFLightPlasmaCannonWeapon

WeaponsFile = nil

BRNT3SHPD = ClassUnit(TStructureUnit) {

    Weapons = {

        GaussCannon = ClassWeapon(TDFGaussCannonWeapon) {

            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
            FxMuzzleFlashScale = 1.1, 
        },     
		
        TurretGun = ClassWeapon(TDFLightPlasmaCannonWeapon) {},

        SAM = ClassWeapon(TSAMLauncher) {},
    },
}

TypeClass = BRNT3SHPD