local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CAMZapperWeapon = import('/lua/cybranweapons.lua').CAMZapperWeapon

URB4201 = ClassUnit(CStructureUnit) {
    
    Weapons = {
        Turret01 = ClassWeapon(CAMZapperWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        CStructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:HideBone('Turret_Muzzle', false)
    end,
}

TypeClass = URB4201