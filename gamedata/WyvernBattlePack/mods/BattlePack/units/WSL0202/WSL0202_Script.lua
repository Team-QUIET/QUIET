local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SDFThauCannon = import('/lua/seraphimweapons.lua').SDFThauCannon

WSL0202 = ClassUnit(SLandUnit) {
    Weapons = {
        MainTurret = ClassWeapon(SDFThauCannon) {},
    },
}

TypeClass = WSL0202