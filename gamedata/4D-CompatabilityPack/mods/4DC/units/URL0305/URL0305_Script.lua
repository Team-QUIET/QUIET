local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local CDFLaserDisintegratorWeapon = import('/lua/cybranweapons.lua').CDFLaserDisintegratorWeapon01

URL0305 = ClassUnit(CWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(CDFLaserDisintegratorWeapon) {},
    },    
}

TypeClass = URL0305