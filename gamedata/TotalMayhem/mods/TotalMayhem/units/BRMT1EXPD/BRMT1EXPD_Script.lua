local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CDFHeavyMicrowaveLaserGeneratorCom = import('/lua/cybranweapons.lua').CDFHeavyMicrowaveLaserGeneratorCom

BRMT1EXPD = ClassUnit(TStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(CDFHeavyMicrowaveLaserGeneratorCom) {},
    },
}

TypeClass = BRMT1EXPD