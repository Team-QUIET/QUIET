local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit

XEL0209 = ClassUnit(TConstructionUnit) {
    OnStopBeingBuilt = function(self)
        self:SetMaintenanceConsumptionActive()
        TConstructionUnit.OnStopBeingBuilt(self)
    end,
}

TypeClass = XEL0209