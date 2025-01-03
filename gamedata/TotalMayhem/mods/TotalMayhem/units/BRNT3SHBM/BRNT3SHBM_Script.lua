local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TDFGaussCannonWeapon              = WeaponsFile.TDFLandGaussCannonWeapon
local TIFCruiseMissileUnpackingLauncher = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local TANTorpedoLandWeapon              = WeaponsFile.TANTorpedoAngler
local TIFCommanderDeathWeapon           = WeaponsFile.TIFCommanderDeathWeapon
local TDFRiotWeapon                     = WeaponsFile.TDFRiotWeapon
local TSAMLauncher                      = WeaponsFile.TSAMLauncher 

WeaponsFile = nil

local MissileRedirect = import('/lua/defaultantiprojectile.lua').MissileTorpDestroy

local TrashBag = TrashBag
local TrashAdd = TrashBag.Add
local TrashDestroy = TrashBag.Destroy

local EffectTemplate        = import('/lua/EffectTemplates.lua')
local CreateAttachedEmitter = CreateAttachedEmitter

BRNT3SHBM = ClassUnit(TWalkingLandUnit) {

    Weapons = {

        TacMissiles = ClassWeapon(TIFCruiseMissileUnpackingLauncher) { FxMuzzleFlashScale = 0.5,

            FxMuzzleFlash = {'/effects/emitters/terran_mobile_missile_launch_01_emit.bp'}
        },
		
        handweapon = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 1,
			
            FxMuzzleFlash = { 
            	'/effects/emitters/proton_artillery_muzzle_01_emit.bp',
            	'/effects/emitters/proton_artillery_muzzle_03_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_smoke_01_emit.bp',                                
            }, 
			
	        FxVentEffect2 = EffectTemplate.WeaponSteam01,
	        FxVentEffect3 = EffectTemplate.CDisruptorGroundEffect,

	        FxMuzzleEffect = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
			
	        PlayFxMuzzleSequence = function(self, muzzle)
			
		        local army = self.unit:GetArmy()

  	            for k, v in self.FxMuzzleEffect do
                    CreateAttachedEmitter(self.unit, muzzle, army, v):ScaleEmitter(1)
                end
				
  	            for k, v in self.FxVentEffect2 do
                    CreateAttachedEmitter(self.unit, muzzle, army, v):ScaleEmitter(0.6)
                end
            end, 
		},
		
        Rockets             = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.5 },
		
        SAM                 = ClassWeapon(TSAMLauncher) { FxMuzzleFlash = EffectTemplate.TAAMissileLaunchNoBackSmoke },	
		
        Torpedoes           = ClassWeapon(TANTorpedoLandWeapon) {},		

        Riotgun             = ClassWeapon(TDFRiotWeapon) { FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank, FxMuzzleFlashScale = 0.2 },
		
        robottalk           = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0 },
		
        DeathWeapon         = ClassWeapon(TIFCommanderDeathWeapon) {},
    },
	
	OnStopBeingBuilt = function(self,builder,layer)

        TWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
 
		self:SetWeaponEnabledByLabel('robottalk', true)

        -- create MissileTorp Defense emitter
        local bp = __blueprints[self.BlueprintID].Defense.MissileTorpDestroy
        
        for _,v in bp.AttachBone do

            local antiMissile1 = MissileRedirect { Owner = self, Radius = bp.Radius, AttachBone = v, RedirectRateOfFire = bp.RedirectRateOfFire }

            TrashAdd( self.Trash, antiMissile1)
            
        end

	end,
}

TypeClass = BRNT3SHBM