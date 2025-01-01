local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CIFBombNeutronWeapon  = import('/lua/cybranweapons.lua').CIFBombNeutronWeapon
local CAAAutocannon         = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

URA0304 = ClassUnit(CAirUnit) {

    Weapons = {
        Bomb = ClassWeapon(CIFBombNeutronWeapon) {},
        AAGun = ClassWeapon(CAAAutocannon) {},
    },
	
    ContrailBones = {'Left_Exhaust','Right_Exhaust'},
	
    ExhaustBones = {'Center_Exhaust',},
    
    OnStopBeingBuilt = function(self,builder,layer)
	
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
		
        self:SetMaintenanceConsumptionInactive()
        self:SetScriptBit('RULEUTC_StealthToggle', true)
        self:RequestRefreshUI()
		
    end,
	
}

TypeClass = URA0304
