local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon


UEL0106 = ClassUnit(TWalkingLandUnit) {
    Weapons = {
        ArmCannonTurret = ClassWeapon(TDFMachineGunWeapon) {
            DisabledFiringBones = {
                'Torso', 'Head',  'Arm_Right_B01', 'Arm_Right_B02','Arm_Right_Muzzle',
                'Arm_Left_B01', 'Arm_Left_B02','Arm_Left_Muzzle'
                },
        },
    },
}
TypeClass = UEL0106

