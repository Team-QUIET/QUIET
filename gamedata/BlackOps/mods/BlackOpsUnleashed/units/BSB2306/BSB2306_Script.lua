local SStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local SDFHeavyQuarnonCannon = import('/lua/seraphimweapons.lua').SDFHeavyQuarnonCannon

BSB2306 = ClassUnit(SStructureUnit) {
    Weapons = {
        Turret = ClassWeapon(SDFHeavyQuarnonCannon) {},
    },
}

TypeClass = BSB2306