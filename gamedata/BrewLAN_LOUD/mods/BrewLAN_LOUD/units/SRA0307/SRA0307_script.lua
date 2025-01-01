local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CIFNaniteTorpedoWeapon = import('/lua/cybranweapons.lua').CIFNaniteTorpedoWeapon

SRA0307 = ClassUnit(CAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(CIFNaniteTorpedoWeapon) {},
    },
    
    OnStopBeingBuilt = function(self,builder,layer)

        CAirUnit.OnStopBeingBuilt(self,builder,layer)

        self:SetMaintenanceConsumptionActive()
        self:EnableUnitIntel('RadarStealth')
    end,
}

TypeClass = SRA0307
