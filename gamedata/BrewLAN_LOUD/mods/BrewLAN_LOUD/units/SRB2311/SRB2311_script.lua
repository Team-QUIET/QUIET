local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CDFProtonCannonWeapon = import('/lua/cybranweapons.lua').CDFProtonCannonWeapon
       
SRB2311 = ClassUnit(CStructureUnit) {
    Weapons = {
        FrontCannon01 = ClassWeapon(CDFProtonCannonWeapon) {},
    },
}
TypeClass = SRB2311
