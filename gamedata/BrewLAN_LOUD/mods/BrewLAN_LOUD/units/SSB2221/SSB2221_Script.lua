local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SSB2221 = ClassUnit(MineStructureUnit) {
    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) {
   			FxDeathLand = EffectTemplate.SZhanaseeBombHit01,
            FxDeathWater = EffectTemplate.SRifterArtilleryWaterHit,
            SplatTexture = {
                Albedo = {'scorch_012_albedo',8}
            },
        },
    },
}
TypeClass = SSB2221
