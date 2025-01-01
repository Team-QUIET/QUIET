local SWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local SDFOhCannon = import('/lua/seraphimweapons.lua').SDFOhCannon

WSL0205 = ClassUnit(SWalkingLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(SDFOhCannon) {},
    },
}
TypeClass = WSL0205