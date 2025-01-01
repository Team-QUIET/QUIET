local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CAAMissileNaniteWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CDFLaserDisintegratorWeapon = import('/lua/cybranweapons.lua').CDFLaserDisintegratorWeapon02

XRA0305 = ClassUnit(CAirUnit) {
    
    Weapons = {
        Missiles1 = ClassWeapon(CAAMissileNaniteWeapon) {},
        Disintegrator01 = ClassWeapon(CDFLaserDisintegratorWeapon) {},
    },
    
    OnStopBeingBuilt = function(self,builder,layer)
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetScriptBit('RULEUTC_StealthToggle', true)
    end,
}
TypeClass = XRA0305