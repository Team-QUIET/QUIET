local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local AAMSaintWeapon = import('/lua/aeonweapons.lua').AAMSaintWeapon
local nukeFiredOnGotTarget = false

UAB4302 = ClassUnit(AStructureUnit) {

    Weapons = {

        MissileRack = ClassWeapon(AAMSaintWeapon) {},
		MissileRack2 = ClassWeapon(AAMSaintWeapon) {},
    },
}

TypeClass = UAB4302