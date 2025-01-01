local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local ADFLaserHighIntensityWeapon           = import('/lua/aeonweapons.lua').ADFLaserHighIntensityWeapon
local CreateAeonCommanderBuildingEffects    = import('/lua/EffectUtilities.lua').CreateAeonCommanderBuildingEffects

UAL0303 = ClassUnit(AWalkingLandUnit) { 
   
    Weapons = {
        FrontTurret01 = ClassWeapon(ADFLaserHighIntensityWeapon) {}
    },
    
    CreateBuildEffects = function( self, unitBeingBuilt, order )
        CreateAeonCommanderBuildingEffects( self, unitBeingBuilt, __blueprints[self.BlueprintID].General.BuildBones.BuildEffectBones, self.BuildEffectsBag )
    end,

    -- handle the permanent projectile & emitters
    OnStopBuild = function(self, unitBeingBuilt)
    
        if self.BuildProjectile then
        
            if self.BuildProjectile.Detached then
                self.BuildProjectile:AttachTo( self, self.BuildPoint )
            end
            
            self.BuildProjectile.Detached = false
        end

    end,    
}

TypeClass = UAL0303