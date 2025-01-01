local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AIFArtillerySonanceShellWeapon = import('/lua/aeonweapons.lua').AIFArtillerySonanceShellWeapon

UAB2302 = ClassUnit(AStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(AIFArtillerySonanceShellWeapon) {},
    },
	
}

TypeClass = UAB2302