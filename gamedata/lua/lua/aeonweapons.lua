---  /lua/aeonweapons.lua
---  Default definitions of Aeon weapons

local WeaponFile = import('/lua/sim/DefaultWeapons.lua')
local DefaultOverchargeWeapon = import('/lua/sim/defaultweapons.lua').OverchargeWeapon
local CollisionBeamFile = import('defaultcollisionbeams.lua')

local QuantumBeamGeneratorCollisionBeam     = CollisionBeamFile.QuantumBeamGeneratorCollisionBeam
local PhasonLaserCollisionBeam              = CollisionBeamFile.PhasonLaserCollisionBeam
local TractorClawCollisionBeam              = CollisionBeamFile.TractorClawCollisionBeam

local BareBonesWeapon               = WeaponFile.BareBonesWeapon
local DefaultProjectileWeapon       = WeaponFile.DefaultProjectileWeapon
local DefaultBeamWeapon             = WeaponFile.DefaultBeamWeapon
local KamikazeWeapon                = WeaponFile.KamikazeWeapon

local BareBonesWeaponOnCreate = BareBonesWeapon.OnCreate

WeaponFile = nil
CollisionBeamFile = nil

local EffectTemplate = import('/lua/EffectTemplates.lua')

local EntityCategoryContains = EntityCategoryContains
local CreateAttachedEmitter  = CreateAttachedEmitter
local CreateEmitterAtBone    = CreateEmitterAtBone
local CreateEmitterAtEntity  = CreateEmitterAtEntity

local ForkThread = ForkThread
local KillThread = KillThread
local VDist2 = VDist2

local GetArmy           = moho.entity_methods.GetArmy
local GetBlueprint      = moho.weapon_methods.GetBlueprint
local GetCurrentTarget  = moho.weapon_methods.GetCurrentTarget
local GetSource         = moho.blip_methods.GetSource

local DefaultBuffField = import('/lua/defaultbufffield.lua').DefaultBuffField

local TARGETS = categories.STRUCTURE + categories.COMMAND + categories.EXPERIMENTAL + categories.NAVAL + categories.SUBCOMMANDER

AeonBuffField = ClassWeapon(DefaultBuffField) {
	AmbientEffects = '/effects/emitters/miasma_cloud_03_emit.bp',
    FieldVisualEmitter = '',
}


AAAAutocannonQuantumWeapon      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/quantum_displacement_cannon_flash_01_emit.bp'} }

AAAAutocannonMissileWeapon      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.ALightDisplacementAutocannonMissileMuzzleFlash }

AAASonicPulseBatteryWeapon      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/sonic_pulse_muzzle_flash_01_emit.bp'} }

AAATemporalFizzWeapon           = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = { '/effects/emitters/temporal_fizz_muzzle_flash_01_emit.bp'},

    FxChargeEffects = { '/effects/emitters/temporal_fizz_muzzle_charge_01_emit.bp', },
    ChargeEffectMuzzles = {},

    PlayFxRackSalvoChargeSequence = function(self)
    
        DefaultProjectileWeapon.PlayFxRackSalvoChargeSequence(self)
		
        local army = self.unit.Army
        
		local CreateAttachedEmitter = CreateAttachedEmitter
		
        for _, valueb in self.ChargeEffectMuzzles do
            for _, valuee in self.FxChargeEffects do
                CreateAttachedEmitter(self.unit,valueb,army, valuee)
            end
        end
    end,
}

AAAZealotMissileWeapon          = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.CZealotLaunch01 }

AAAZealot02MissileWeapon        = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/flash_04_emit.bp'} }

AAMSaintWeapon                  = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.ASaintLaunch01 }

AAMWillOWisp                    = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AAntiMissileFlareFlash }

AANChronoTorpedoWeapon          = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/default_muzzle_flash_01_emit.bp',
        '/effects/emitters/default_muzzle_flash_02_emit.bp',
        '/effects/emitters/torpedo_underwater_launch_01_emit.bp',
    },
    FxTrailScale = 0.6,
    FxMuzzleFlashScale = 0.6,
}

AANDepthChargeBombWeapon        = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/antiair_muzzle_fire_02_emit.bp',},

    CreateProjectileForWeapon = function(self, bone)
    
        local proj = self:CreateProjectile(bone)
        
        local damageTable = self.damageTable
        
        local blueprint = self.bp
        local data = false
        
        if blueprint.DoTDamage then
        
            data = {
                Army = self.unit.Army,
                StartRadius = blueprint.DOTStartRadius,
                EndRadius = blueprint.DOTEndRadius,
                DOTtype = blueprint.DOTtype,
                Damage = blueprint.DoTDamage,
                Duration = blueprint.DoTDuration,
                Frequency = blueprint.DoTFrequency,
                Type = 'Normal',
            }
        end

        if proj and not proj:BeenDestroyed() then
            proj:PassDamageData(damageTable)
            
            if data then
                proj:PassData(data)
            end
        end
        
        return proj
    end,
}

AANTorpedoCluster               = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/aeon_torpedocluster_flash_01_emit.bp',},

    CreateProjectileForWeapon = function(self, bone)
    
        local proj = self:CreateProjectile(bone)
        
        local damageTable = self.damageTable
        
        local blueprint = self.bp
        local data = false

        if blueprint.DoTDamage then
        
            data = {
                Army = self.unit.Army,
                StartRadius = blueprint.DOTStartRadius,
                EndRadius = blueprint.DOTEndRadius,
                DOTtype = blueprint.DOTtype,
                Damage = blueprint.DoTDamage,
                Duration = blueprint.DoTDuration,
                Frequency = blueprint.DoTFrequency,
                Type = 'Normal',
            }
        end

        if proj and not proj:BeenDestroyed() then
        
            proj:PassDamageData(damageTable)

            if data then
                proj:PassData(data)
            end
        end
        
        return proj

    end,
}

ACruiseMissileWeapon            = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/aeon_missile_launch_01_emit.bp'} }

ADFCannonQuantumWeapon          = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AQuantumCannonMuzzle01 }

ADFCannonOblivionWeapon         = ClassWeapon(DefaultProjectileWeapon) { FxChargeMuzzleFlash = {'/effects/emitters/oblivion_cannon_flash_01_emit.bp',
        '/effects/emitters/oblivion_cannon_flash_02_emit.bp',
        '/effects/emitters/oblivion_cannon_flash_03_emit.bp',
    },
}

ADFCannonOblivionWeapon02       = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AOblivionCannonMuzzleFlash02,
    FxChargeMuzzleFlash = EffectTemplate.AOblivionCannonChargeMuzzleFlash02,
}

ADFChronoDampener               = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AChronoDampener,
    FxMuzzleFlashScale = 0.5,

    CreateProjectileAtMuzzle = function(self, muzzle)
    end,
}

ADFDisruptorCannonWeapon        = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.ADisruptorCannonMuzzle01 }

ADFDisruptorWeapon              = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
    FxChargeMuzzleFlash = EffectTemplate.ASDisruptorCannonChargeMuzzle01,
}

ADFGravitonProjectorWeapon      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AGravitonBolterMuzzleFlash01 }

ADFHeavyDisruptorCannonWeapon   = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.Aeon_HeavyDisruptorCannonMuzzleFlash,
    FxChargeMuzzleFlash = EffectTemplate.Aeon_HeavyDisruptorCannonMuzzleCharge,
}

ADFLaserHighIntensityWeapon     = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AHighIntensityLaserFlash01 }

ADFLaserLightWeapon             = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/flash_04_emit.bp' },}

ADFOverchargeWeapon             = ClassWeapon(DefaultOverchargeWeapon) { FxMuzzleFlash = EffectTemplate.ACommanderOverchargeFlash01, DesiredWeaponLabel = 'RightDisruptor'}

ADFQuantumAutogunWeapon         = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.Aeon_DualQuantumAutoGunMuzzleFlash }

ADFReactonCannon                = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/reacton_cannon_muzzle_charge_01_emit.bp',
                           '/effects/emitters/reacton_cannon_muzzle_charge_02_emit.bp',
                           '/effects/emitters/reacton_cannon_muzzle_charge_03_emit.bp',
                           '/effects/emitters/reacton_cannon_muzzle_flash_01_emit.bp',
                           '/effects/emitters/reacton_cannon_muzzle_flash_02_emit.bp',
                           '/effects/emitters/reacton_cannon_muzzle_flash_03_emit.bp',},
}

ADFSonicPulsarWeapon            = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/flash_02_emit.bp'},
    FxMuzzleFlashScale = 0.5,
}

AIFArtilleryMiasmaShellWeapon   = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = false,

    CreateProjectileForWeapon = function(self, bone)
    
        local proj = self:CreateProjectile(bone)
        
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

        if proj and not proj:BeenDestroyed() then
        
            proj:PassDamageData(damageTable)
            
            if data then
                proj:PassData(data)
            end
        end

        return proj
    end,
}

AIFArtillerySonanceShellWeapon  = ClassWeapon(DefaultProjectileWeapon) { FxChargeMuzzleFlash = {'/effects/emitters/aeon_sonance_muzzle_01_emit.bp',
        '/effects/emitters/aeon_sonance_muzzle_02_emit.bp',
        '/effects/emitters/aeon_sonance_muzzle_03_emit.bp',
    },
}

AIFBombQuarkWeapon              = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/antiair_muzzle_fire_02_emit.bp'} }

AIFMissileTacticalSerpentineWeapon      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = {'/effects/emitters/aeon_missile_launch_02_emit.bp'} }

AIFMissileTacticalSerpentine02Weapon    = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.ASerpFlash01 }

AIFMortarWeapon                 = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = false }

AIFQuanticArtillery             = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.Aeon_QuanticClusterMuzzleFlash,
    FxChargeMuzzleFlash = EffectTemplate.Aeon_QuanticClusterChargeMuzzleFlash,
}

AIFQuasarAntiTorpedoWeapon      = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AQuasarAntiTorpedoFlash,

    FxTrailScale = 0.5,
    FxMuzzleFlashScale = 0.5,
}

AIFSmartCharge                  = ClassWeapon(DefaultProjectileWeapon) {

    CreateProjectileAtMuzzle = function(self, muzzle)
    
        local proj = DefaultProjectileWeapon.CreateProjectileAtMuzzle(self, muzzle)
        
        local tbl = self.bp.DepthCharge
        
        proj:AddDepthCharge(tbl)
    end,
}


----- Bare Bones Weapons -----

AIFCommanderDeathWeapon         = ClassWeapon(BareBonesWeapon) {

    OnCreate = function(self)
	
        BareBonesWeaponOnCreate(self)

        local myBlueprint = self.bp
		
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
    end,

    OnFire = function(self)
    end,

    Fire = function(self)

        local myProjectile = self.unit:CreateProjectile( self.bp.ProjectileId, 0, 0, 0, nil, nil, nil):SetCollision(false)
		
        myProjectile:PassDamageData(self.damageTable)
		
        if self.Data then
            myProjectile:PassData(self.Data)
        end
    end,
}

AIFParagonDeathWeapon           = ClassWeapon(BareBonesWeapon) {

    OnCreate = function(self)
    
        BareBonesWeaponOnCreate(self)

        local myBlueprint = self.bp

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
    end,


    OnFire = function(self)
    end,

    Fire = function(self)

        local myProjectile = self.unit:CreateProjectile( self.bp.ProjectileId, 0, 0, 0, nil, nil, nil):SetCollision(false)
		
        myProjectile:PassDamageData(self.damageTable)
		
        if self.Data then
            myProjectile:PassData(self.Data)
        end
    end,
}


----- BEAM WEAPONS -----

AeonTargetPainter       = ClassWeapon(DefaultBeamWeapon) { FxMuzzleFlash = false }

ADFPhasonLaser          = ClassWeapon(DefaultBeamWeapon) { BeamType = PhasonLaserCollisionBeam,

    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
    
        if not self.ContBeamOn then
        
            local army = self.unit.Army
            
            local bp = self.bp
            
			local CreateAttachedEmitter = CreateAttachedEmitter
			
            for k, v in self.FxUpackingChargeEffects do
				if bp.RackBones[self.CurrentRackNumber].MuzzleBones then
					for ek, ev in bp.RackBones[self.CurrentRackNumber].MuzzleBones do
						CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
					end
				end
            end
            
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

ADFTractorClawStructure = ClassWeapon(DefaultBeamWeapon) { BeamType = TractorClawCollisionBeam, FxMuzzleFlash = false }

AQuantumBeamGenerator   = ClassWeapon(DefaultBeamWeapon) { BeamType = QuantumBeamGeneratorCollisionBeam,

    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
    
        local army = self.unit.Army
        
        local bp = self.bp
        
		local CreateAttachedEmitter = CreateAttachedEmitter
		
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
            end
        end
        
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

ADFTractorClaw          = ClassWeapon(DefaultBeamWeapon) { BeamType = TractorClawCollisionBeam,
    FxMuzzleFlash = false,
   
    PlayFxBeamStart = function(self, muzzle)
    
        local target = GetCurrentTarget(self)

        if not target or

            EntityCategoryContains( TARGETS, target ) or
            
            not EntityCategoryContains(categories.ALLUNITS, target) then
            
            return
        end

        -- Can't pass recon blips down
        target = self:GetRealTarget(target)
        
		-- something already shooting at this target
        if self:IsTargetAlreadyUsed(target) then 
            return 
        end
		
        local army = GetArmy(target)
        
        -- Create vacuum suck up from ground effects on the unit targetted.
        for k, v in EffectTemplate.ACollossusTractorBeamVacuum01 do
            CreateEmitterAtEntity( target, army, v ):ScaleEmitter(0.25*target:GetFootPrintSize()/0.5)
        end
        
        DefaultBeamWeapon.PlayFxBeamStart(self, muzzle)

        self.TT1 = self:ForkThread(self.TractorThread, target)
        self:ForkThread(self.TractorWatchThread, target)
        
    end,
    
    -- override this function in the unit to check if another weapon already has this
    -- unit as a target.  Target argument should not be a recon blip
    IsTargetAlreadyUsed = function(self, target)

        local weap
		
        for i = 1, self.unit:GetWeaponCount() do
		
            weap = self.unit:GetWeapon(i)
			
            if (weap != self) then
                if self:GetRealTarget( GetCurrentTarget(weap) ) == target then
                    --LOG("Target already used by ", repr(weap.bp.Label))
                    return true
                end
            end
        end
        return false
    end,

    -- recon blip check
    GetRealTarget = function(self, target)
		
        if target and not IsUnit(target) then
            local unitTarget = GetSource(target)
            local unitPos = unitTarget:GetPosition()
            local reconPos = target:GetPosition()
            local dist = VDist2(unitPos[1], unitPos[3], reconPos[1], reconPos[3])
            if dist < 10 then
                return unitTarget
            end
        end
        return target      
    end,

    OnLostTarget = function(self)
        self:AimManipulatorSetEnabled(true)
        DefaultBeamWeapon.OnLostTarget(self)
        DefaultBeamWeapon.PlayFxBeamEnd(self,self.Beams[1].Beam)
    end,

    TractorThread = function(self, target)
        self.unit.Trash:Add(target)
        local beam = self.Beams[1].Beam
        if not beam then return end


        local muzzle = self.bp.MuzzleSpecial
        if not muzzle then return end

        target:SetDoNotTarget(true)
        local pos0 = beam:GetPosition(0)
        local pos1 = beam:GetPosition(1)
        local dist = VDist3(pos0, pos1)

        self.Slider = CreateSlider(self.unit, muzzle, 0, 0, dist, -1, true)

        WaitTicks(1)
        WaitFor(self.Slider)

        -- just in case attach fails...
        target:SetDoNotTarget(false)
		safecall("Ernie cant grapple", moho.entity_methods.AttachBoneTo, target, -1, self.unit, muzzle)
        target:SetDoNotTarget(true)
        
        self.AimControl:SetResetPoseTime(10)

        self.Slider:SetSpeed(15)
        self.Slider:SetGoal(0,0,0)
        
        WaitTicks(1)
        WaitFor(self.Slider)

        if not target.Dead then
            --target.DestructionExplosionWaitDelayMin = 0
            --target.DestructionExplosionWaitDelayMax = 0

            local army = GetArmy(self.unit)
			local CreateEmitterAtBone = CreateEmitterAtBone
            
            for kEffect, vEffect in EffectTemplate.ACollossusTractorBeamCrush01 do
                CreateEmitterAtBone( self.unit, muzzle , army, vEffect )
            end
			
			target:SetDoNotTarget(false)
            
            target:Kill(self.unit, 'Damage', 100)
        end
        
        self.AimControl:SetResetPoseTime(2)
    end,

    TractorWatchThread = function(self, target)
        while not target.Dead do
            WaitTicks(1)
        end
		
        KillThread(self.TT1)
        self.TT1 = nil
		
        if self.Slider then
            self.Slider:Destroy()
            self.Slider = nil
        end
		
        self.unit:DetachAll(self.bp.MuzzleSpecial or 0)
        self:ResetTarget()
        self.AimControl:SetResetPoseTime(2)
    end,
}

--AIFBallisticMortarWeapon    = ClassWeapon(DefaultProjectileWeapon) { FxMuzzleFlash = EffectTemplate.AIFBallisticMortarFlash02 }

--ADFLaserHeavyWeapon = ClassWeapon(DefaultProjectileWeapon) { FxChargeMuzzleFlash = false }

--AKamikazeWeapon = ClassWeapon(KamikazeWeapon) { FxMuzzleFlash = false }

--AIFBombGravitonWeapon           = ClassWeapon(DefaultProjectileWeapon) {}

--AIFQuantumWarhead               = ClassWeapon(DefaultProjectileWeapon) {}
