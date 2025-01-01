local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TOrbitalDeathLaserBeamWeapon = import('/lua/terranweapons.lua').TOrbitalDeathLaserBeamWeapon
local CDFParticleCannonWeapon = import('/lua/cybranweapons.lua').CDFParticleCannonWeapon

SEL0320 = ClassUnit(TLandUnit) {
    Weapons = {
        OrbitalDeathLaserWeapon = ClassWeapon(TOrbitalDeathLaserBeamWeapon){},
        TargetFinder = ClassWeapon(CDFParticleCannonWeapon) {
            FxMuzzleFlash = {'/effects/emitters/particle_cannon_muzzle_02_emit.bp'},
        },
    },
}

TypeClass = SEL0320
