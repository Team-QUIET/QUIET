local CSubUnit =  import('/lua/defaultunits.lua').SubUnit

local CANNaniteTorpedoWeapon = import('/lua/cybranweapons.lua').CANNaniteTorpedoWeapon
local CDFLaserHeavyWeapon = import('/lua/cybranweapons.lua').CDFLaserHeavyWeapon

URS0203 = ClassUnit(CSubUnit) {

    Weapons = {
        MainGun = ClassWeapon(CDFLaserHeavyWeapon) {},
        Torpedo = ClassWeapon(CANNaniteTorpedoWeapon) {},
    },

}

TypeClass = URS0203