local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local ADFGravitonProjectorWeapon = import('/lua/aeonweapons.lua').ADFGravitonProjectorWeapon

UAB2101 = ClassUnit(AStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFGravitonProjectorWeapon) {},
    },
}

TypeClass = UAB2101