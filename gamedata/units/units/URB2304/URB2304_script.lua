local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CAAMissileNaniteWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

URB2304 = ClassUnit(CStructureUnit) {

    Weapons = {
        AAMissileRack = ClassWeapon(CAAMissileNaniteWeapon) {},
    },
}

TypeClass = URB2304