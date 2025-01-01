local CLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CDFElectronBolterWeapon = import('/lua/cybranweapons.lua').CDFElectronBolterWeapon

WRL0301 = ClassUnit(CLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(CDFElectronBolterWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
       CLandUnit.OnStopBeingBuilt(self,builder,layer)
       self:SetMaintenanceConsumptionActive()
    end,

}

TypeClass = WRL0301