local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TDFHiroPlasmaCannon = WeaponsFile.TDFHiroPlasmaCannon

WEB4301 = ClassUnit(TStructureUnit) {
    Weapons = {
        AntiMissile = ClassWeapon(TDFHiroPlasmaCannon) {},
    },
}

TypeClass = WEB4301