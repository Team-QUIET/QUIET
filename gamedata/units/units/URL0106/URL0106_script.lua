local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

URL0106 = ClassUnit(CWalkingLandUnit) {

    Weapons = {
        MainGun = ClassWeapon(import('/lua/cybranweapons.lua').CDFLaserPulseLightWeapon) {},
    },
}

TypeClass = URL0106