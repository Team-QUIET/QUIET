local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CDFParticleCannonWeapon = import('/lua/cybranweapons.lua').CDFParticleCannonWeapon

URB2301 = ClassUnit(CStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(CDFParticleCannonWeapon) {
            FxMuzzleFlash = {'/effects/emitters/particle_cannon_muzzle_02_emit.bp'},
        },
    },
}

TypeClass = URB2301