local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

BROT1HPD = ClassUnit(TStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 1, FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01 },
    },
}

TypeClass = BROT1HPD