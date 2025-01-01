local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AIFArtilleryMiasmaShellWeapon = import('/lua/aeonweapons.lua').AIFArtilleryMiasmaShellWeapon

UAB2303 = ClassUnit(AStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(AIFArtilleryMiasmaShellWeapon) {},
    },
}

TypeClass = UAB2303