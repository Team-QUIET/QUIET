local CAirUnit = import('/lua/defaultunits.lua').AirUnit

SRA0201 = ClassUnit(CAirUnit) {

    OnStopBeingBuilt = function(self,builder,layer)
	
        CAirUnit.OnStopBeingBuilt(self,builder,layer)

    end,
}

TypeClass = SRA0201
