---  /lua/terranweapons.lua
---  Terran-specific weapon definitions

local BareBonesWeapon           = import('/lua/sim/DefaultWeapons.lua').BareBonesWeapon
local DefaultBeamWeapon         = import('/lua/sim/DefaultWeapons.lua').DefaultBeamWeapon
local DefaultProjectileWeapon   = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local DefaultOverchargeWeapon   = import('/lua/sim/defaultweapons.lua').OverchargeWeapon

local OrbitalDeathLaserCollisionBeam    = import('defaultcollisionbeams.lua').OrbitalDeathLaserCollisionBeam
local TDFHiroCollisionBeam              = import('defaultcollisionbeams.lua').TDFHiroCollisionBeam

local EffectTemplate = import('/lua/EffectTemplates.lua')

local CreateAttachedEmitter = CreateAttachedEmitter

TAAFlakArtilleryCannon                  = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
    
    -- Custom over-ride for this weapon, so it passes data and damageTable
    CreateProjectileForWeapon = function(self, bone)
    
        local proj = self:CreateProjectile(bone)
        local damageTable = self.damageTable
        
        local blueprint = self.bp
        local data = false
        
        if blueprint.DOTDamage then
        
            data = {

                Damage = blueprint.DoTDamage,
                Duration = blueprint.DoTDuration,
                Frequency = blueprint.DoTFrequency,
                Radius = blueprint.DamageRadius,
                Type = 'Normal',
                DamageFriendly = blueprint.DamageFriendly,
            }
        end

        if proj and not proj:BeenDestroyed() then
        
            proj:PassDamageData(damageTable)
            
            if data then
                proj:PassData(data)
            end
        end

        return proj
    end
}

TAALinkedRailgun                        = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TRailGunMuzzleFlash01 }

TAMInterceptorWeapon                    = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/terran_antinuke_launch_01_emit.bp'} }

TAMPhalanxWeapon                        = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TPhalanxGunMuzzleFlash,
    FxShellEject  = EffectTemplate.TPhalanxGunShells,

    PlayFxMuzzleSequence = function(self, muzzle)
    
        local army = self.unit.Army
        local bp = self.bp
        
		local CreateAttachedEmitter = CreateAttachedEmitter
		
		DefaultProjectileWeapon.PlayFxMuzzleSequence(self, muzzle)
        
		for _, v in self.FxShellEject do
            CreateAttachedEmitter(self.unit, bp.TurretBonePitch, army, v):ScaleEmitter(self.FxMuzzleFlashScale)
        end
    end,
}

TANTorpedoAngler                        = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/default_muzzle_flash_01_emit.bp',
        '/effects/emitters/default_muzzle_flash_02_emit.bp',
        '/effects/emitters/torpedo_underwater_launch_01_emit.bp',
    },
}

TDFFragmentationGrenadeLauncherWeapon   = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.THeavyFragmentationGrenadeMuzzleFlash }

TDFPlasmaCannonWeapon                   = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash }

TDFLightPlasmaCannonWeapon              = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TPlasmaCannonLightMuzzleFlash }

TDFHeavyPlasmaCannonWeapon              = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TPlasmaCannonHeavyMuzzleFlash }

TDFOverchargeWeapon                     = ClassWeapon(DefaultOverchargeWeapon) { FxMuzzleFlash = EffectTemplate.TCommanderOverchargeFlash01, DesiredWeaponLabel = 'RightZephyr' }

TDFMachineGunWeapon                     = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/machinegun_muzzle_fire_01_emit.bp',
        '/effects/emitters/machinegun_muzzle_fire_02_emit.bp',
    },
}

TDFGaussCannonWeapon                    = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TGaussCannonFlash}

TDFShipGaussCannonWeapon                = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash}

TDFLandGaussCannonWeapon                = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TLandGaussCannonFlash}

TDFZephyrCannonWeapon                   = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TLaserMuzzleFlash}

TDFRiotWeapon                           = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFx}

TDFIonizedPlasmaCannon                  = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TIonizedPlasmaGatlingCannonMuzzleFlash}

TIFArtilleryWeapon                      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TIFArtilleryMuzzleFlash }

TIFCarpetBombWeapon                     = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/antiair_muzzle_fire_02_emit.bp'},

    CreateProjectileForWeapon = function(self, bone)
        local projectile = self:CreateProjectile(bone)
        local damageTable = self.damageTable
        
        local blueprint = self.bp
        local data = false
        
        if blueprint.DoTDamage then
        
            data = {
                Damage = blueprint.DoTDamage,
                Duration = blueprint.DoTDuration,
                Frequency = blueprint.DoTFrequency,
                Radius = blueprint.DamageRadius,
                Type = 'Normal',
                DamageFriendly = blueprint.DamageFriendly,
            }
        end
        
        if projectile and not projectile:BeenDestroyed() then
            if data then
                projectile:PassData(data)
            end
            projectile:PassDamageData(damageTable)
        end
        
        return projectile
    end,
}

TIFCruiseMissileLauncher                = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TIFCruiseMissileLaunchSmoke}

TIFCruiseMissileLauncherSub             = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TIFCruiseMissileLaunchUnderWater}

TIFHighBallisticMortarWeapon            = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TMobileMortarMuzzleEffect01 }

TIFSmallYieldNuclearBombWeapon          = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/antiair_muzzle_fire_02_emit.bp'} }

TIFSmartCharge                          = ClassWeapon(DefaultProjectileWeapon) {

    CreateProjectileAtMuzzle = function(self, muzzle)
        local proj = DefaultProjectileWeapon.CreateProjectileAtMuzzle(self, muzzle)
        local tbl = self.bp.DepthCharge
        proj:AddDepthCharge(tbl)
    end,
}

TSAMLauncher                            = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.TAAMissileLaunch}



TDFHiroPlasmaCannon                     = ClassWeapon(DefaultBeamWeapon) { BeamType = TDFHiroCollisionBeam,

    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
    
        if not self.ContBeamOn then
        
            local army = self.unit.Army
            local bp = self.bp
            
			local CreateAttachedEmitter = CreateAttachedEmitter
			
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

TOrbitalDeathLaserBeamWeapon            = ClassWeapon(DefaultBeamWeapon) { BeamType = OrbitalDeathLaserCollisionBeam,
    
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
    
        local army = self.unit.Army
        local bp = self.bp
        
        local CreateAttachedEmitter = CreateAttachedEmitter
		
        for _, v in self.FxUpackingChargeEffects do
            for _, ev in bp.RackBones[self.CurrentRackNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
            end
        end
        
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

TerranTargetPainter                     = ClassWeapon(DefaultBeamWeapon) { FxMuzzleFlash = false }


TIFCommanderDeathWeapon                 = ClassWeapon(BareBonesWeapon) {

    FiringMuzzleBones = {0}, -- just fire from the base bone of the unit

    OnCreate = function(self)
    
        BareBonesWeapon.OnCreate(self)
        
        local myBlueprint = self.bp
        
        --# The "or x" is supplying default values in case the blueprint doesn't have an overriding value
        self.Data = {
            NukeOuterRingDamage = myBlueprint.NukeOuterRingDamage or 10,
            NukeOuterRingRadius = myBlueprint.NukeOuterRingRadius or 40,
            NukeOuterRingTicks = myBlueprint.NukeOuterRingTicks or 20,
            NukeOuterRingTotalTime = myBlueprint.NukeOuterRingTotalTime or 10,

            NukeInnerRingDamage = myBlueprint.NukeInnerRingDamage or 2000,
            NukeInnerRingRadius = myBlueprint.NukeInnerRingRadius or 30,
            NukeInnerRingTicks = myBlueprint.NukeInnerRingTicks or 24,
            NukeInnerRingTotalTime = myBlueprint.NukeInnerRingTotalTime or 24,
        }

        self:SetWeaponEnabled(false)
    end,

    OnFire = function(self)

    end,

    Fire = function(self)
    
        local myBlueprint = self.bp
        local myProjectile = self.unit:CreateProjectile( myBlueprint.ProjectileId, 0, 0, 0, nil, nil, nil):SetCollision(false)
        
        myProjectile:PassDamageData(self.damageTable)
        
        if self.Data then
            myProjectile:PassData(self.Data)
        end
    end,

}

--[[
TANTorpedoLandWeapon = ClassWeapon(DefaultProjectileWeapon) {
    FxMuzzleFlash = {
		'/effects/emitters/default_muzzle_flash_01_emit.bp',
        '/effects/emitters/default_muzzle_flash_02_emit.bp',
        '/effects/emitters/torpedo_underwater_launch_01_emit.bp',
    },
}

--TAAGinsuRapidPulseWeapon                = ClassWeapon(DefaultProjectileWeapon) {}

--TIFCruiseMissileUnpackingLauncher       = ClassWeapon(DefaultProjectileWeapon) {}

--TIFStrategicMissileWeapon               = ClassWeapon(DefaultProjectileWeapon) {}

--]]
