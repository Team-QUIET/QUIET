local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local TerranWeaponFile = import('/lua/terranweapons.lua')

local TDFHeavyPlasmaCannonWeapon = TerranWeaponFile.TDFHeavyPlasmaCannonWeapon

UEL0303 = ClassUnit(TWalkingLandUnit) {

    Weapons = {
        HeavyPlasma01 = ClassWeapon(TDFHeavyPlasmaCannonWeapon) {
            DisabledFiringBones = {
                'Torso', 'ArmR_B02', 'Barrel_R', 'ArmR_B03', 'ArmR_B04',
                'ArmL_B02', 'Barrel_L', 'ArmL_B03', 'ArmL_B04',
            },
        },
    }, 
}

TypeClass = UEL0303