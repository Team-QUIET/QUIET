local SStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local DisarmBeamWeapon = import('/lua/sim/defaultweapons.lua').DisarmBeamWeapon

SSB2380 = ClassUnit(SStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(DisarmBeamWeapon) {},
    },
}
TypeClass = SSB2380
