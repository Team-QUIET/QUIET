local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CDFRocketIridiumWeapon = import('/lua/cybranweapons.lua').CDFRocketIridiumWeapon

URA0203 = ClassUnit(CAirUnit) {

    Weapons = {
        Missile01 = ClassWeapon(CDFRocketIridiumWeapon) {},
    },

    DestructionPartsChassisToss = {'URA0203',},

    OnStopBeingBuilt = function(self,builder,layer)
	
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
		
    end,

    OnMotionVertEventChange = function(self, new, old)
	
        CAirUnit.OnMotionVertEventChange(self, new, old)

        -- We want to keep the ambient sound
        -- playing during the landing sequence
        if (new == 'Down') then

            self:PlayUnitAmbientSound('AmbientMove')
			
        end

        if new == 'Bottom' then
		
            self:StopUnitAmbientSound( 'AmbientMove' )
			
        end

    end,

}

TypeClass = URA0203