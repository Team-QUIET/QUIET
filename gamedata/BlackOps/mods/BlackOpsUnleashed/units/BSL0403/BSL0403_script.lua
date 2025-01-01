local SEnergyBallUnit = import('/lua/seraphimunits.lua').SEnergyBallUnit

local SDFUnstablePhasonBeam = import('/lua/seraphimweapons.lua').SDFUnstablePhasonBeam

local EffectTemplate = import('/lua/EffectTemplates.lua')

BSL0403 = ClassUnit(SEnergyBallUnit) {
    Weapons = {
        PhasonBeam = ClassWeapon(SDFUnstablePhasonBeam) {},
    },
    
    OnCreate = function(self)
    
        SEnergyBallUnit.OnCreate(self)
        
        for k, v in EffectTemplate.OthuyAmbientEmanation do
            CreateAttachedEmitter(self,'Outer_Tentaclebase', self:GetArmy(), v)
        end
        self:HideBone(0,true)
    end,
}
TypeClass = BSL0403