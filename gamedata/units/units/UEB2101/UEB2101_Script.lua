local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TDFLightPlasmaCannonWeapon = import('/lua/terranweapons.lua').TDFLightPlasmaCannonWeapon

UEB2101 = ClassUnit(TStructureUnit) {
    Weapons = {
        MainGun = ClassWeapon(TDFLightPlasmaCannonWeapon) {}
    },
}

TypeClass = UEB2101