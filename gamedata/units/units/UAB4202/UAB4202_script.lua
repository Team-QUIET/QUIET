local AShieldStructureUnit = import('/lua/aeonunits.lua').AShieldStructureUnit

local LOUDINSERT = table.insert
local LOUDATTACHEMITTER = CreateAttachedEmitter
local LOUDROTATE = CreateRotator

UAB4202 = ClassUnit(AShieldStructureUnit) {
    ShieldEffects = {},
    
    OnStopBeingBuilt = function(self,builder,layer)
        AShieldStructureUnit.OnStopBeingBuilt(self,builder,layer)
		self.ShieldEffectsBag = {}
    end,

    OnShieldEnabled = function(self)
        AShieldStructureUnit.OnShieldEnabled(self)
		
		local LOUDROTATE = CreateRotator
		
        if not self.OrbManip1 then
            self.OrbManip1 = LOUDROTATE(self, 'Orb', 'x', nil, 0, 45, -45)
            self.Trash:Add(self.OrbManip1)
        end
        self.OrbManip1:SetTargetSpeed(-45)
        if not self.OrbManip2 then
            self.OrbManip2 = LOUDROTATE(self, 'Orb', 'z', nil, 0, 45, 45)
            self.Trash:Add(self.OrbManip2)
        end
        self.OrbManip2:SetTargetSpeed(45)

        if self.ShieldEffectsBag then
            for _, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
        

        local army = self:GetArmy()
        local LOUDINSERT = table.insert
		local LOUDATTACHEMITTER = CreateAttachedEmitter
		
        for _, v in self.ShieldEffects do
            LOUDINSERT( self.ShieldEffectsBag, LOUDATTACHEMITTER( self, 0, army, v ):ScaleEmitter(0.75) )
        end
		
    end,

    OnShieldDisabled = function(self)
        AShieldStructureUnit.OnShieldDisabled(self)
        if self.OrbManip1 then
            self.OrbManip1:SetSpinDown(true)
            self.OrbManip1:SetTargetSpeed(0)
        end
        if self.OrbManip2 then
            self.OrbManip2:SetSpinDown(true)
            self.OrbManip2:SetTargetSpeed(0)
        end
        if self.ShieldEffectsBag then
            for _, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
    end,
    
    OnKilled = function(self, instigator, type, overkillRatio)
        AShieldStructureUnit.OnKilled(self, instigator, type, overkillRatio)
        if self.OrbManip1 then
            self.OrbManip1:Destroy()
            self.OrbManip1 = nil
        end
        if self.OrbManip2 then
            self.OrbManip2:Destroy()
            self.OrbManip2 = nil
        end
    end,    
}

TypeClass = UAB4202

