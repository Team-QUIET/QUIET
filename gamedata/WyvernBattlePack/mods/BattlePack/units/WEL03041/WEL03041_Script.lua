local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

WEL03041 = ClassUnit(TLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(TIFArtilleryWeapon) {
        }
    },
	
	OnCreate = function(self)
        TLandUnit.OnCreate(self)
        self:HideBone('AATurret_Yaw', true)
    end,
	
	OnStopBeingBuilt = function(self,builder,layer)
        TLandUnit.OnStopBeingBuilt(self,builder,layer)
        self:HideBone('AATurret_Yaw', true)
    end,
}

TypeClass = WEL03041