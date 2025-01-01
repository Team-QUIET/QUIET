local SWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local ChonkChromBeam = import('/lua/seraphimweapons.lua').BrewLANUltraChonkChromBeamGenerator
local TracerChromBeam = import('/lua/seraphimweapons.lua').BrewLANTracerChromBeamGenerator
local EffectUtil = import('/lua/EffectUtilities.lua')


SSL0404 = ClassUnit(SWalkingLandUnit) {

    Weapons = {
    
        MainGun = ClassWeapon(ChonkChromBeam) {},
        
        MainTracer = ClassWeapon(TracerChromBeam) {
			OnWeaponFired = function(self, target)
				TracerChromBeam.OnWeaponFired(self, target)
				ChangeState( self.unit, self.unit.VisibleState )
			end,

			OnLostTarget = function(self)
				TracerChromBeam.OnLostTarget(self)
				if not self.unit:IsUnitState('Busy') then
				    ChangeState( self.unit, self.unit.InvisState )
				end
			end,
        },
    },

    StartBeingBuiltEffects = function(self, builder, layer)
		SWalkingLandUnit.StartBeingBuiltEffects(self, builder, layer)
		self:ForkThread( EffectUtil.CreateSeraphimExperimentalBuildBaseThread, builder, self.OnBeingBuiltEffectsBag )
    end,

    OnAnimCollision = function(self, bone, x, y, z)
        SWalkingLandUnit.OnAnimCollision(self, bone, x, y, z)
    end,

    OnStopBeingBuilt = function(self, builder, layer)
    
        SWalkingLandUnit.OnStopBeingBuilt(self, builder, layer)

        --These start enabled, so before going to InvisState, disabled them.. they'll be reenabled shortly
        self:DisableUnitIntel('RadarStealth')
		self:DisableUnitIntel('Cloak')
		self.Cloaked = false
        
        ChangeState( self, self.InvisState ) -- If spawned in we want the unit to be invis, normally the unit will immediately start moving
    end,
    
    -- Inserted Maintenance Consumption (for the cloak)

    InvisState = State() {
    
        Main = function(self)
        
            self.Cloaked = false
            
            local bp = self:GetBlueprint()
            
            if bp.Intel.StealthWaitTime then
                WaitSeconds( bp.Intel.StealthWaitTime )
            end
            
			self:EnableUnitIntel('RadarStealth')
			self:EnableUnitIntel('Cloak')
			self.Cloaked = true
            
            self:SetMaintenanceConsumptionActive()
            
            if bp.Display.CloakMeshBlueprint then
                self:SetMesh(bp.Display.CloakMeshBlueprint, true)
            end
        end,

        OnMotionHorzEventChange = function(self, new, old)
        
            if new != 'Stopped' then
                ChangeState( self, self.VisibleState )
            end
            
            SWalkingLandUnit.OnMotionHorzEventChange(self, new, old)
        end,
    },

    VisibleState = State() {
    
        Main = function(self)
        
            if self.Cloaked then
            
                self:DisableUnitIntel('RadarStealth')
			    self:DisableUnitIntel('Cloak')
                local bp = self:GetBlueprint()
                
                if bp.Display.CloakMeshBlueprint then
                    self:SetMesh(bp.Display.MeshBlueprint, true)
                end
                
    			self.Cloaked = false
                
                self:SetMaintenanceConsumptionInactive()                
			end
        end,

        OnMotionHorzEventChange = function(self, new, old)
        
            if new == 'Stopped' then
                ChangeState( self, self.InvisState )
            end
            
            SWalkingLandUnit.OnMotionHorzEventChange(self, new, old)
        end,
    },
}

TypeClass = SSL0404
