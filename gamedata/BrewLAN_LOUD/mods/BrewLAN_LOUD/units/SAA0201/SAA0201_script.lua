local AAirUnit = import('/lua/defaultunits.lua').AirUnit

SAA0201 = ClassUnit(AAirUnit) {

    OnScriptBitSet = function(self, bit)
	
        AAirUnit.OnScriptBitSet(self, bit)
		
        if bit == 1 then

            self:SetSpeedMult(0.26666666666667)     # change the speed of the unit by this mult
            self:SetAccMult(0.25)       # change the acceleration of the unit by this mult
            self:SetTurnMult(0.25)      # change the turn ability of the unit by this mult
        end
		
    end,
	
    OnScriptBitClear = function(self, bit)
	
        AAirUnit.OnScriptBitClear(self, bit)
		
        if bit == 1 then
            self:SetSpeedMult(1)
            self:SetAccMult(1)
            self:SetTurnMult(1)
        end
		
    end,
}
TypeClass = SAA0201
