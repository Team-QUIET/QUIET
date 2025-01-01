local TMobileFactoryUnit = import('/lua/defaultunits.lua').MobileUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TIFArtilleryWeapon        = WeaponsFile.TIFArtilleryWeapon
local TAAFlakArtilleryCannon    = WeaponsFile.TAAFlakArtilleryCannon
local TIFCruiseMissileLauncher  = WeaponsFile.TIFCruiseMissileLauncher
local TDFHiroPlasmaCannon       = WeaponsFile.TDFHiroPlasmaCannon
local TDFGaussCannonWeapon      = WeaponsFile.TDFLandGaussCannonWeapon
local TDFRiotWeapon             = WeaponsFile.TDFRiotWeapon

WeaponsFile = nil

local EffectTemplate = import('/lua/EffectTemplates.lua')


WEL0401 = ClassUnit(TMobileFactoryUnit) {

	Weapons = {
    
        Turret      = ClassWeapon(TDFGaussCannonWeapon) {},
        
        Riotgun     = ClassWeapon(TDFRiotWeapon) { FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank },

		MainGun     = ClassWeapon(TIFArtilleryWeapon) { FxMuzzleFlashScale = 1.5 },
        
		AAGun       = ClassWeapon(TAAFlakArtilleryCannon) { PlayOnlyOneSoundCue = true },
        
		Rockets     = ClassWeapon(TIFCruiseMissileLauncher) {},
        
		TMD         = ClassWeapon(TDFHiroPlasmaCannon) {},
    },
}

TypeClass = WEL0401