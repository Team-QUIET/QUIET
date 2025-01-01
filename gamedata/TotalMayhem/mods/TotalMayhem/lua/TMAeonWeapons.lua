local WeaponFile = import('/lua/sim/DefaultWeapons.lua')

local DefaultBeamWeapon = WeaponFile.DefaultBeamWeapon

local TMCollisionBeamFile = import('/mods/TotalMayhem/lua/TMcollisionbeams.lua')

local EffectTemplate = import('/lua/EffectTemplates.lua')

local TMNovaCatBlueLaserBeam    = TMCollisionBeamFile.TMNovaCatBlueLaserBeam
local TMNovaCatGreenLaserBeam   = TMCollisionBeamFile.TMNovaCatGreenLaserBeam
local TMMizuraBlueLaserBeam     = TMCollisionBeamFile.TMMizuraBlueLaserBeam

TMAnovacatbluelaserweapon   = ClassWeapon(DefaultBeamWeapon) { BeamType = TMNovaCatBlueLaserBeam,

    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 0.5,
}

TMAnovacatgreenlaserweapon  = ClassWeapon(DefaultBeamWeapon) { BeamType = TMNovaCatGreenLaserBeam,

    FxChargeMuzzleFlash = EffectTemplate.SDFExperimentalPhasonProjChargeMuzzleFlash,
    FxUpackingChargeEffects = EffectTemplate.SDFExperimentalPhasonProjChargeMuzzleFlash,
    FxUpackingChargeEffectScale = 0.5,
}

TMAmizurabluelaserweapon    = ClassWeapon(DefaultBeamWeapon) { BeamType = TMMizuraBlueLaserBeam,

    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 0.5,
}