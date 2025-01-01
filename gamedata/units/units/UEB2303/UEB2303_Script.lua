local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

UEB2303 = ClassUnit(TStructureUnit) {

    OnStopBeingBuilt = function(self,builder,layer)
        TStructureUnit.OnStopBeingBuilt(self,builder,layer)
        local bp = self:GetBlueprint()
        if bp.Audio.Activate then
            self:PlaySound(bp.Audio.Activate)
        end
    end,

    Weapons = {
        MainGun = ClassWeapon(TIFArtilleryWeapon) {
        },
    },
}

TypeClass = UEB2303