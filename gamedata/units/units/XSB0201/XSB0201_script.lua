local SLandFactoryUnit = import('/lua/seraphimunits.lua').SLandFactoryUnit

XSB0201 = ClassUnit(SLandFactoryUnit) {
    OnCreate = function(self)
        SLandFactoryUnit.OnCreate(self)
        local bp = self:GetBlueprint()
        self.Rotator1 = CreateRotator(self, 'Pod01', 'y', nil, 5, 0, 0)
        self.Trash:Add(self.Rotator1)

        self.Rotator2 = CreateRotator(self, 'Pod02', 'y', nil, 8, 0, 0)
        self.Trash:Add(self.Rotator2)
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        self.Rotator1:SetSpeed(0)
        self.Rotator2:SetSpeed(0)
        SLandFactoryUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

}

TypeClass = XSB0201