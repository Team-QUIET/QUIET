local SWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local SAAShleoCannonWeapon = import('/lua/seraphimweapons.lua').SAAShleoCannonWeapon

BSL0106 = ClassUnit(SWalkingLandUnit) {
    Weapons = {
        LaserTurret = ClassWeapon(SAAShleoCannonWeapon) {},
    },
}
TypeClass = BSL0106