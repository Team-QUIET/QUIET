local ARadarUnit = import('/lua/defaultunits.lua').RadarUnit
local AnimationThread = import('/lua/effectutilities.lua').IntelDishAnimationThread

SAB3301 = ClassUnit(ARadarUnit) {
    OnStopBeingBuilt = function(self, ...)
        ARadarUnit.OnStopBeingBuilt(self, unpack(arg) )
        self:ForkThread(AnimationThread,{
            {
                'Yaw_Pivot',
                'Pitch_Pivot',
                --c = 1,
                bounds = {-180,180,-90,0,},
                speed = 3,
            },
        })
    end,

    OnIntelDisabled = function(self)
        ARadarUnit.OnIntelDisabled(self)
        self.Intel = false
    end,

    OnIntelEnabled = function(self)
        ARadarUnit.OnIntelEnabled(self)
        self.Intel = true
    end,
}

TypeClass = SAB3301
