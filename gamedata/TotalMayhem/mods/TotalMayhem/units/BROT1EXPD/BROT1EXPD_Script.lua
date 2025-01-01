local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TMAmizurabluelaserweapon = import('/mods/TotalMayhem/lua/TMAeonWeapons.lua').TMAmizurabluelaserweapon

BROT1EXPD = ClassUnit(TStructureUnit) {
    Weapons = {
        laserblue = ClassWeapon(TMAmizurabluelaserweapon) {},
    },
}

TypeClass = BROT1EXPD