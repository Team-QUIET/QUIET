local CAirUnit = import('/lua/defaultunits.lua').AirUnit

local CIFBombNeutronWeapon = import('/lua/cybranweapons.lua').CIFBombNeutronWeapon

SRA0211 = ClassUnit(CAirUnit) {
    Weapons = {
        Bomb = ClassWeapon(CIFBombNeutronWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetScriptBit('RULEUTC_StealthToggle', true)
    end,
}

TypeClass = SRA0211
