local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local ADFSonicPulsarWeapon = import('/lua/aeonweapons.lua').ADFSonicPulsarWeapon

BAL0110 = ClassUnit(AWalkingLandUnit) {
    Weapons = {
        ArmLaserTurret = ClassWeapon(ADFSonicPulsarWeapon) {}
    },
}

TypeClass = BAL0110