local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

BAB2308 = ClassUnit(AStructureUnit) {

    Weapons = {
        CruiseMissile = ClassWeapon(import('/lua/aeonweapons.lua').ACruiseMissileWeapon) {},
    },
}

TypeClass = BAB2308
