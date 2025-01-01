local CLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CDFParticleCannonWeapon = import('/lua/cybranweapons.lua').CDFParticleCannonWeapon

URL0202 = ClassUnit(CLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(CDFParticleCannonWeapon) {},
    },
}

TypeClass = URL0202