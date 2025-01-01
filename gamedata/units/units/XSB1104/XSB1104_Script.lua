local SMassFabricationUnit = import('/lua/seraphimunits.lua').SMassFabricationUnit

XSB1104 = ClassUnit(SMassFabricationUnit) {

    OnCreate = function(self)
        SMassFabricationUnit.OnCreate(self)
        self.Rotator = CreateRotator(self, 'Blades', 'y', nil, 0, 50, 0)
        self.Trash:Add(self.Rotator)
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        SMassFabricationUnit.OnStopBeingBuilt(self,builder,layer)
        ChangeState(self, self.ActiveState)
    end,

    ActiveState = State {
        Main = function(self)
            self.Rotator:SetSpinDown(false)
            self.Rotator:SetTargetSpeed(180)
        end,

        OnProductionPaused = function(self)
            SMassFabricationUnit.OnProductionPaused(self)
            ChangeState(self, self.InActiveState)
        end,
    },

    InActiveState = State {
        Main = function(self)
            self.Rotator:SetSpinDown(true)
            WaitFor(self.Rotator)
        end,

        OnProductionUnpaused = function(self)
            SMassFabricationUnit.OnProductionUnpaused(self)
            ChangeState(self, self.ActiveState)
        end,
    },
}

TypeClass = XSB1104