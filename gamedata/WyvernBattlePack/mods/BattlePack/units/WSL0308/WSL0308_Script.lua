local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SDFThauCannon = import('/lua/seraphimweapons.lua').SDFThauCannon

WSL0308 = ClassUnit(SLandUnit) {
    Weapons = {
        MainTurret = ClassWeapon(SDFThauCannon) {},
    },
}
TypeClass = WSL0308