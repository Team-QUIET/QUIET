local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local CAMEMPMissileWeapon = import('/lua/cybranweapons.lua').CAMEMPMissileWeapon

SAL0321 = ClassUnit(AWalkingLandUnit) {

    Weapons = {
        AntiNuke = ClassWeapon(CAMEMPMissileWeapon) {},
    },
}

TypeClass = SAL0321
