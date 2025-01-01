local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SRB2220 = ClassUnit(MineStructureUnit) {
    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) {
            FxDeathLand = EffectTemplate.CHvyProtonCannonHitUnit,
        },
    },
}
TypeClass = SRB2220
