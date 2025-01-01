local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local CDFHeavyMicrowaveLaserGeneratorCom = CybranWeaponsFile.CDFHeavyMicrowaveLaserGeneratorCom

BRMT1EXPDT2 = ClassUnit(TStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(CDFHeavyMicrowaveLaserGeneratorCom) {},
    },
}

TypeClass = BRMT1EXPDT2