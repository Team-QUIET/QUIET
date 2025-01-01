local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local ACruiseMissileWeapon = import('/lua/aeonweapons.lua').ACruiseMissileWeapon

UAB2108 = ClassUnit(AStructureUnit) {
    Weapons = {
        CruiseMissile = ClassWeapon(ACruiseMissileWeapon) {},
    },
}
TypeClass = UAB2108
