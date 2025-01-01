local SWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon

local ForkThread = ForkThread
local WaitTicks = coroutine.yield

BSL0007 = ClassUnit(SWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(SIFSuthanusArtilleryCannon) {}
    },

    OnStopBeingBuilt = function(self, builder, layer)
	
		SWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)

        if not self.Dead then
            self:SetMaintenanceConsumptionActive()
            self:ForkThread(self.ResourceThread)
            self:SetVeterancy(5)
			self.Brain = self:GetAIBrain()
        end
    end,
    
    OnKilled = function(self, instigator, type, overkillRatio)

        self:SetWeaponEnabledByLabel('MainGun', false)

        IssueClearCommands(self)

        SWalkingLandUnit.OnKilled(self, instigator, type, overkillRatio)
    end,
    
    ResourceThread = function(self) 

    	if not self.Dead then
		
        	local energy = self.Brain:GetEconomyStored('Energy')

        	if  energy <= 10 then 
            	self:ForkThread(self.KillFactory)
        	else
            	self:ForkThread(self.EconomyWaitUnit)
        	end
    	end    
	end,

	EconomyWaitUnit = function(self)
	
    	if not self.Dead then
		
			WaitTicks(50)
			
        	if not self.Dead then
            	self:ForkThread(self.ResourceThread)
        	end
    	end
	end,
	
	KillFactory = function(self)
    	self:Kill()
	end,
}

TypeClass = BSL0007