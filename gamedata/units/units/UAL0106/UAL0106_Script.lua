local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local ADFSonicPulsarWeapon = import('/lua/aeonweapons.lua').ADFSonicPulsarWeapon

UAL0106 = ClassUnit(AWalkingLandUnit) {
    Weapons = {
        ArmLaserTurret = ClassWeapon(ADFSonicPulsarWeapon) {}
    },

}


TypeClass = UAL0106