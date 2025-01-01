local TAirStagingPlatformUnit = import('/lua/defaultunits.lua').AirStagingPlatformUnit

BEB0001 = ClassUnit(TAirStagingPlatformUnit) {

Parent = nil,

SetParent = function(self, parent, droneName)
    self.Parent = parent
    self.Drone = droneName
end,
	OnDamage = function()
    end,
}
TypeClass = BEB0001