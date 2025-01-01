local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon

UAB2304 = ClassUnit(AStructureUnit) {

    Weapons = {
        AAMissileRack = ClassWeapon(AAAZealotMissileWeapon) {},
    },
}

TypeClass = UAB2304