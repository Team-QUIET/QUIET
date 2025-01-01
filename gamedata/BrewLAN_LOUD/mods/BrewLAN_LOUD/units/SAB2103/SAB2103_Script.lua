local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AIFArtilleryMiasmaShellWeapon = import('/lua/aeonweapons.lua').AIFArtilleryMiasmaShellWeapon

SAB2103 = ClassUnit(AStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(AIFArtilleryMiasmaShellWeapon) {},
    },
}

TypeClass = SAB2103
