local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris

local EffectTemplates = import('/lua/EffectTemplates.lua')

GenericDebris = ClassDummyProjectile( BaseGenericDebris ){
    FxImpactLand = EffectTemplates.GenericDebrisLandImpact01,
    FxTrails = EffectTemplates.GenericDebrisTrails01,
}
