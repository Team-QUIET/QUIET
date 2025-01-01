local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CDFLaserHeavyWeapon = import('/lua/cybranweapons.lua').CDFLaserHeavyWeapon02

URA0203 = ClassUnit(CAirUnit) {
    Weapons = {
        MainGun = ClassWeapon(CDFLaserHeavyWeapon) {}
    },

    DestructionPartsChassisToss = {'XRA0105',},

    OnStopBeingBuilt = function(self,builder,layer)
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
    end,

    OnMotionVertEventChange = function(self, new, old)
        CAirUnit.OnMotionVertEventChange(self, new, old)

        if (new == 'Down') then
            # Keep the ambient hover sound going
            self:PlayUnitAmbientSound('AmbientMove')
        end

        if new == 'Bottom' then
            self:StopUnitAmbientSound( 'AmbientMove' )
        end
    end,

}

TypeClass = URA0203