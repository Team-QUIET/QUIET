local TMassFabricationUnit = import('/lua/defaultunits.lua').MassFabricationUnit
local CreateRotator = CreateRotator

UEB1303 = ClassUnit(TMassFabricationUnit) {

    OnStopBeingBuilt = function(self,builder,layer)
        TMassFabricationUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator = CreateRotator(self, 'Spinner', 'z')
        self.Rotator:SetAccel(10)
        self.Rotator:SetTargetSpeed(20)
        self.Trash:Add(self.Rotator)
    end,
    
    OnProductionPaused = function(self)
        TMassFabricationUnit.OnProductionPaused(self)
        self.Rotator:SetSpinDown(true)
		if self.AmbientEffects then
			self.AmbientEffects:Destroy()
			self.AmbientEffects = nil
		end            
    end,
    
    OnProductionUnpaused = function(self)
        TMassFabricationUnit.OnProductionUnpaused(self)
        self.Rotator:SetTargetSpeed(20)
        self.Rotator:SetSpinDown(false)
    end,
}

TypeClass = UEB1303