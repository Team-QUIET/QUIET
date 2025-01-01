local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TAMPhalanxWeapon = import('/lua/terranweapons.lua').TAMPhalanxWeapon

local CreateRotator = CreateRotator

BRNT1EXPD = ClassUnit(TStructureUnit) {

    Weapons = {
	
        gatling1 = ClassWeapon(TAMPhalanxWeapon) { FxMuzzleFlashScale = 0.3,		

            PlayFxWeaponUnpackSequence = function(self)
            
                if not self.SpinManip then 
                    self.SpinManip = CreateRotator(self.unit, 'spinner02', 'z', nil, 180, 360, 0)
                    self.unit.Trash:Add(self.SpinManip)
                end
                
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(360)
                end
                
                TAMPhalanxWeapon.PlayFxWeaponUnpackSequence(self)
            end,

            PlayFxWeaponPackSequence = function(self)
            
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
				end
				
                TAMPhalanxWeapon.PlayFxWeaponPackSequence(self)
			end,
        },

        gatling2 = ClassWeapon(TAMPhalanxWeapon) { FxMuzzleFlashScale = 0.3,
		
            PlayFxWeaponUnpackSequence = function(self)
			
                if not self.SpinManip then 
                    self.SpinManip = CreateRotator(self.unit, 'spinner01', 'z', nil, -180, 360, 0)
                    self.unit.Trash:Add(self.SpinManip)
                end
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(-360)
                end
				
                TAMPhalanxWeapon.PlayFxWeaponUnpackSequence(self)
            end,

            PlayFxWeaponPackSequence = function(self)
            
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
				
                TAMPhalanxWeapon.PlayFxWeaponPackSequence(self)
            end,
        },
    },
}

TypeClass = BRNT1EXPD