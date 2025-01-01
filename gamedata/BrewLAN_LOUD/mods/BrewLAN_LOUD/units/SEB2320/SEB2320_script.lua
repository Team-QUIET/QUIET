local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFHiroPlasmaCannon = import('/lua/terranweapons.lua').TDFHiroPlasmaCannon

SEB2320 = ClassUnit(TStructureUnit) {
    Weapons = {
        HiroCannon = ClassWeapon(TDFHiroPlasmaCannon) {},
    },
}
TypeClass = SEB2320
