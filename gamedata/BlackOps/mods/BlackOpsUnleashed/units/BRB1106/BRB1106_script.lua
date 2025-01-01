local CMassStorageUnit = import('/lua/defaultunits.lua').StructureUnit

BRB1106 = ClassUnit(CMassStorageUnit) {

    OnStopBeingBuilt = function(self,builder,layer)
    
        CMassStorageUnit.OnStopBeingBuilt(self,builder,layer)
        
        self:ForkThread(self.AnimThread)
        
        local myBlueprint = __blueprints[self.BlueprintID]
        
        if myBlueprint.Audio.Activate then
            self:PlaySound(myBlueprint.Audio.Activate)
        end
    end,

    AnimThread = function(self)
        local sliderManip = CreateStorageManip(self, 'Mass', 'MASS', 0, 0, 0, 0, 0, .55)
		local sliderManip2 = CreateStorageManip(self, 'Energy', 'ENERGY', 0, 0, 0, 0, 0, 0.6)
    end,
}

TypeClass = BRB1106