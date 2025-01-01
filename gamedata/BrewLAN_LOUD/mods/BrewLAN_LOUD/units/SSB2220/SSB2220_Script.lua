local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SSB2220 = ClassUnit(MineStructureUnit) {
    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) {
   			FxDeathLand = EffectTemplate.SOtheBombHitUnit,
        },
    },
}
TypeClass = SSB2220
