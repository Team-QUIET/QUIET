local MineStructureUnit = import('/lua/defaultunits.lua').MineStructureUnit

local EffectTemplate = import('/lua/EffectTemplates.lua')

SAB2220 = ClassUnit(MineStructureUnit) {

    Weapons = {
        Suicide = ClassWeapon(MineStructureUnit.Weapons.Suicide) {FxDeathLand = EffectTemplate.ABombHit01},
    },
    
}
TypeClass = SAB2220
