local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

SAB2311 = ClassUnit(AStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon02) {},
    },
}

TypeClass = SAB2311
