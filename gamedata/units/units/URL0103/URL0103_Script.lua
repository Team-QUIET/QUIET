local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local CIFGrenadeWeapon = import('/lua/cybranweapons.lua').CIFGrenadeWeapon

URL0103 = ClassUnit(CWalkingLandUnit) {

    DestructionTicks = 200,

    Weapons = {
        MainGun = ClassWeapon(CIFGrenadeWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/cybran_artillery_muzzle_flash_01_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_flash_02_emit.bp',
                '/effects/emitters/cannon_muzzle_smoke_02_emit.bp',
            },
            FxMuzzleFlashScale = 0.5,
        },
    },
	
    OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
    end,
}

TypeClass = URL0103

