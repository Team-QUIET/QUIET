local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AIFArtilleryMiasmaShellWeapon = import('/lua/aeonweapons.lua').AIFArtilleryMiasmaShellWeapon

LAB2320 = ClassUnit(AStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(AIFArtilleryMiasmaShellWeapon) {},
        MainGun1 = ClassWeapon(AIFArtilleryMiasmaShellWeapon) {},
        MainGun2 = ClassWeapon(AIFArtilleryMiasmaShellWeapon) {},
    },
}

TypeClass = LAB2320