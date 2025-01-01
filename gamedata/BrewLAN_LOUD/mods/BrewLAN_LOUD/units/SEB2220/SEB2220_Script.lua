local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SEB2220 = ClassUnit(MineStructureUnit) {
    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) {
   			FxDeathLand = EffectTemplate.TSmallYieldNuclearBombHit01,
        },
    },
}
TypeClass = SEB2220
