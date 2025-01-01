local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CDFLaserHeavyWeapon = import('/lua/cybranweapons.lua').CDFLaserHeavyWeapon

URB2101 = ClassUnit(CStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(CDFLaserHeavyWeapon) {}
    },
}

TypeClass = URB2101
