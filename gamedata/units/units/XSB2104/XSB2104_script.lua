local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SAAShleoCannonWeapon = import('/lua/seraphimweapons.lua').SAAShleoCannonWeapon

XSB2104 = ClassUnit(SStructureUnit) {

    Weapons = {
        AAGun = ClassWeapon(SAAShleoCannonWeapon) { FxMuzzleScale = 1.5 },
    },
	
}

TypeClass = XSB2104
