local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CIFMissileLoaTacticalWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaTacticalWeapon

URB2108 = ClassUnit(CStructureUnit) {
    Weapons = {
        CruiseMissile = ClassWeapon(CIFMissileLoaTacticalWeapon) {},
    },
}
TypeClass = URB2108