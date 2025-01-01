local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local cWeapons = import('/lua/cybranweapons.lua')

local CDFLaserDisintegratorWeapon = cWeapons.CDFLaserDisintegratorWeapon01


WRL0305 = ClassUnit(CWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(CDFLaserDisintegratorWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
    
       CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
       
       self:SetMaintenanceConsumptionActive()
    end,
    
}

TypeClass = WRL0305