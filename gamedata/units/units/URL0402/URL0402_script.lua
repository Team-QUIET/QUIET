local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local CDFHeavyMicrowaveLaserGenerator   = CybranWeaponsFile.CDFHeavyMicrowaveLaserGenerator
local CDFElectronBolterWeapon           = CybranWeaponsFile.CDFElectronBolterWeapon
local CAAMissileNaniteWeapon            = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CANNaniteTorpedoWeapon            = CybranWeaponsFile.CANNaniteTorpedoWeapon

CybranWeaponsFile = nil

local explosion = import('/lua/defaultexplosions.lua')

local CreateDeathExplosion  = explosion.CreateDefaultHitExplosionAtBone
local CreateFlash           = explosion.CreateFlash

explosion = nil

local EffectTemplate = import('/lua/EffectTemplates.lua')
local utilities = import('/lua/Utilities.lua')
local CleanupEffectBag = import('/lua/EffectUtilities.lua').CleanupEffectBag

--local Entity = import('/lua/sim/Entity.lua').Entity

local function GetRandomFloat( Min, Max )
    return Min + (Random() * (Max-Min) )
end


URL0402 = ClassUnit(CWalkingLandUnit) {

    Weapons = {

        MainGun         = ClassWeapon(CDFHeavyMicrowaveLaserGenerator) {},
        BolterLeft      = ClassWeapon(CDFElectronBolterWeapon) {},
        BolterRight     = ClassWeapon(CDFElectronBolterWeapon) {},        
        AAMissile       = ClassWeapon(CAAMissileNaniteWeapon) {},
        Torpedo         = ClassWeapon(CANNaniteTorpedoWeapon) {},
    },
    
    OnStartBeingBuilt = function(self, builder, layer)
	
        CWalkingLandUnit.OnStartBeingBuilt(self, builder, layer)
		
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
        end
        
        self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationActivate, false):SetRate(0)
    end,

    OnStopBeingBuilt = function(self,builder,layer)
	
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
		
        if self.AnimationManipulator then
            self:SetUnSelectable(true)
            self.AnimationManipulator:SetRate(1)
            
            self:ForkThread(function()
                WaitSeconds(self.AnimationManipulator:GetAnimationDuration()*self.AnimationManipulator:GetRate())
                self:SetUnSelectable(false)
                self.AnimationManipulator:Destroy()
            end)
        end        
		
        self:SetMaintenanceConsumptionActive()
		
        local layer = self:GetCurrentLayer()
        
		-- If created with F2 on land, then play the transform anim.
        if(layer == 'Land') then
		
            self:CreateUnitAmbientEffect(layer)
			
        elseif (layer == 'Seabed') then
		
            self:CreateUnitAmbientEffect(layer)

        end

        self.WeaponsEnabled = true
    end,

	OnLayerChange = function(self, new, old)
	
		CWalkingLandUnit.OnLayerChange(self, new, old)
		
		if self.WeaponsEnabled then
			if( new == 'Land' ) then

			    self:CreateUnitAmbientEffect(new)

			elseif ( new == 'Seabed' ) then

			    self:CreateUnitAmbientEffect(new)

			end
		end
	end,
	
    AmbientExhaustBones         = {'Exhaust01','Exhaust02','Exhaust03','Exhaust06','Exhaust05'},	
    AmbientLandExhaustEffects   = {'/effects/emitters/dirty_exhaust_smoke_02_emit.bp','/effects/emitters/dirty_exhaust_sparks_02_emit.bp'},
    AmbientSeabedExhaustEffects = {'/effects/emitters/underwater_vent_bubbles_02_emit.bp'},	
	
	CreateUnitAmbientEffect = function(self, layer)
    
	    if( self.AmbientEffectThread != nil ) then
	       self.AmbientEffectThread:Destroy()
        end	 
        
        if self.AmbientExhaustEffectsBag then
            CleanupEffectBag(self,'AmbientExhaustEffectsBag')
        end        
        
        self.AmbientEffectThread = nil
        self.AmbientExhaustEffectsBag = {}
		
	    if layer == 'Land' then
	        self.AmbientEffectThread = self:ForkThread(self.UnitLandAmbientEffectThread)
	    elseif layer == 'Seabed' then

	        local army = self:GetArmy()

			for kE, vE in self.AmbientSeabedExhaustEffects do
				for kB, vB in self.AmbientExhaustBones do
					table.insert( self.AmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
				end
			end	        
	    end          
	end, 
	
	UnitLandAmbientEffectThread = function(self)

        local army = self:GetArmy()

		while not self.Dead do

			for kE, vE in self.AmbientLandExhaustEffects do
			
				for kB, vB in self.AmbientExhaustBones do
					table.insert( self.AmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
				end
			end
			
			WaitSeconds(2)
			
			CleanupEffectBag(self,'AmbientExhaustEffectsBag')

			WaitSeconds( GetRandomFloat(1,7) )
		end		
	end,

    OnKilled = function(self, inst, type, okr)
	
        self.Trash:Destroy()
        self.Trash = TrashBag()
		
        if self.AmbientExhaustEffectsBag then
            CleanupEffectBag(self,'AmbientExhaustEffectsBag')
        end
		
        CWalkingLandUnit.OnKilled(self, inst, type, okr)
    end,

    CreateDamageEffects = function(self, bone, army )
        for k, v in EffectTemplate.DamageFireSmoke01 do
            CreateAttachedEmitter( self, bone, army, v ):ScaleEmitter(1.5)
        end
    end,

    CreateDeathExplosionDustRing = function( self )
    
        local blanketSides = 18
        local blanketAngle = 6.28 / blanketSides
        local blanketStrength = 1
        local blanketVelocity = 2.8

        for i = 0, (blanketSides-1) do
        
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)

            local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 1.5, blanketZ + 4, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
        end        
    end,

    CreateFirePlumes = function( self, army, bones, yBoneOffset )
	
        local proj, position, offset, velocity
        
        local basePosition = self:GetPosition()
		
        for k, vBone in bones do
        
            position = self:GetPosition(vBone)
            
            offset = utilities.GetDifferenceVector( position, basePosition )
            velocity = utilities.GetDirectionVector( position, basePosition )
            
            velocity[1] = velocity[1] + GetRandomFloat(-0.3, 0.3)
            velocity[2] = velocity[2] + GetRandomFloat(-0.3, 0.3)
            velocity[3] = velocity[3] + GetRandomFloat( 0.0, 0.3)
            
            proj = self:CreateProjectile('/effects/entities/DestructionFirePlume01/DestructionFirePlume01_proj.bp', offset.x, offset.y + yBoneOffset, offset.z, velocity[1], velocity[2], velocity[3] )
            proj:SetBallisticAcceleration(GetRandomFloat(-1, -2)):SetVelocity(GetRandomFloat(3, 4)):SetCollision(false)
            
            local emitter = CreateEmitterOnEntity(proj, army, '/effects/emitters/destruction_explosion_fire_plume_02_emit.bp')

            local lifetime = GetRandomFloat( 12, 22 )
        end
    end,

    CreateExplosionDebris = function( self, army )
    
        for k, v in EffectTemplate.ExplosionDebrisLrg01 do
            CreateAttachedEmitter( self, 'URL0402', army, v )
        end
        
    end,

    DeathThread = function(self)
    
        self:PlayUnitSound('Destroyed')
        
        local army = self.Army

        CreateFlash( self, 'Center_Turret', 4.5, army )
        
        CreateAttachedEmitter(self, 'URL0402', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp')
        CreateAttachedEmitter(self,'URL0402', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp')
        
        self:CreateFirePlumes( army, {'Center_Turret'}, 0 )
        self:CreateFirePlumes( army, {'Right_Leg01_B01','Right_Leg03_B01','Left_Leg03_B01',}, 0.5 )

        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )

        WaitSeconds(0.8)
        

        CreateDeathExplosion( self, 'Center_Turret', 1.5)
        self:CreateDamageEffects( 'Center_Turret_B01', army )
        self:CreateDamageEffects( 'Center_Turret_Barrel', army )

        WaitSeconds( 1 )
        self:CreateFirePlumes( army, {'Right_Leg01_B01','Right_Leg03_B01','Left_Leg03_B01',}, 0.5 )
        WaitSeconds(0.3)
        self:CreateDeathExplosionDustRing()
        WaitSeconds(0.4)


        -- When the spider bot impacts with the ground
        -- Effects: Explosion on turret, dust effects on the muzzle tip, large dust ring around unit
        -- Other: Damage force ring to force trees over and camera shake
        self:ShakeCamera(50, 5, 0, 1)
        
        CreateDeathExplosion( self, 'Left_Turret_Muzzle', 1)
        
        for k, v in EffectTemplate.FootFall01 do
            CreateAttachedEmitter(self,'Center_Turret_Muzzle',army, v):ScaleEmitter(2)          
            CreateAttachedEmitter(self,'Center_Turret_Muzzle',army, v):ScaleEmitter(2) 
        end


        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )

        local x, y, z = unpack(self:GetPosition())
        z = z + 3
        
        DamageRing(self, {x,y,z}, 0.1, 3, 1, 'Force', true)
        WaitSeconds(0.4)
        CreateDeathExplosion( self, 'Center_Turret', 2)

        -- Finish up force ring to push trees
        DamageRing(self, {x,y,z}, 0.1, 3, 1, 'Force', true)

        -- Explosion on and damage fire on various bones
        CreateDeathExplosion( self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        CreateDeathExplosion( self, 'Left_Projectile01', 2)
        self:CreateFirePlumes( army, {'Left_Projectile01'}, -1 )
        self:CreateDamageEffects( 'Right_Turret', army )
        WaitSeconds(0.4)
        
        CreateDeathExplosion( self, 'Left_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        self:CreateDamageEffects( 'Right_Leg01_B03', army )
        WaitSeconds(0.4)
        CreateDeathExplosion( self, 'Left_Turret_Muzzle', 1)
        self:CreateExplosionDebris( army )
        
        CreateDeathExplosion( self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        self:CreateDamageEffects( 'Right_Projectile0' .. Random(1,2), army )
        WaitSeconds(0.4)
        
        CreateDeathExplosion( self, 'Left_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        CreateDeathExplosion( self, 'Left_Projectile01', 2 )
        self:CreateDamageEffects( 'Left_Leg03_B03', army )

        self:CreateWreckage(0.1)
        self:Destroy()
    end,
}

TypeClass = URL0402
