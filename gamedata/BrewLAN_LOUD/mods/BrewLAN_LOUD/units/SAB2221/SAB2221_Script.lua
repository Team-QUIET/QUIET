local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SAB2221 = ClassUnit(MineStructureUnit) {

    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) { FxDeathLand = EffectTemplate.AOblivionCannonHit02 },
    },
}
TypeClass = SAB2221
