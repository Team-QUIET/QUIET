local TAirFactoryUnit = import('/lua/terranunits.lua').TAirFactoryUnit

local WaitFor = WaitFor

UEB0302 = ClassUnit(TAirFactoryUnit) {
    
    StartArmsMoving = function(self)
        TAirFactoryUnit.StartArmsMoving(self)
        if not self.ArmSlider1 then
            self.ArmSlider1 = CreateSlider(self, 'Arm01')
            self.Trash:Add(self.ArmSlider1)
        end
        if not self.ArmSlider2 then
            self.ArmSlider2 = CreateSlider(self, 'Arm02')
            self.Trash:Add(self.ArmSlider2)
        end
        if not self.ArmSlider3 then
            self.ArmSlider3 = CreateSlider(self, 'Arm03')
            self.Trash:Add(self.ArmSlider3)
        end
    end,

    MovingArmsThread = function(self)
        TAirFactoryUnit.MovingArmsThread(self)
		local WaitFor = WaitFor
        local dir = 1
        while true do
            if not self.ArmSlider1 then return end
            if not self.ArmSlider2 then return end
            if not self.ArmSlider3 then return end
            self.ArmSlider1:SetGoal(0, -5, 0)
            self.ArmSlider1:SetSpeed(20)
            self.ArmSlider2:SetGoal(0, 2 * dir, 0)
            self.ArmSlider2:SetSpeed(10)
            self.ArmSlider3:SetGoal(0, 5, 0)
            self.ArmSlider3:SetSpeed(20)
            WaitFor(self.ArmSlider3)
            self.ArmSlider1:SetGoal(0, 0, 0)
            self.ArmSlider1:SetSpeed(20)
            self.ArmSlider2:SetGoal(0, 0, 0)
            self.ArmSlider2:SetSpeed(10)
            self.ArmSlider3:SetGoal(0, 0, 0)
            self.ArmSlider3:SetSpeed(20)
            WaitFor(self.ArmSlider3)
            dir = dir * -1
        end
    end,
    
    StopArmsMoving = function(self)
        TAirFactoryUnit.StopArmsMoving(self)
        self.ArmSlider1:SetGoal(0, 0, 0)
        self.ArmSlider2:SetGoal(0, 0, 0)
        self.ArmSlider3:SetGoal(0, 0, 0)
        self.ArmSlider1:SetSpeed(40)
        self.ArmSlider2:SetSpeed(40)
        self.ArmSlider3:SetSpeed(40)
    end,
}

TypeClass = UEB0302
