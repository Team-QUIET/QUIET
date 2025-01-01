local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AIFQuanticArtillery = import('/lua/aeonweapons.lua').AIFQuanticArtillery

XAB2307 = ClassUnit(AStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(AIFQuanticArtillery) {},
    },
}
TypeClass = XAB2307