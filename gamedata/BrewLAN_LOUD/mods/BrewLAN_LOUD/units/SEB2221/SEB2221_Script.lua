local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SEB2221 = ClassUnit(MineStructureUnit) {
    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) {
   			FxDeathLand = EffectTemplate.TAntiMatterShellHit01,
            SplatTexture = {
                Albedo = 'nuke_scorch_002_albedo',
                AlphaNormals = 'nuke_scorch_001_normals',
            },
        },
    },
}
TypeClass = SEB2221
