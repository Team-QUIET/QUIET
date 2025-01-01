local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SIFHuAntiNukeWeapon = import('/lua/seraphimweapons.lua').SIFHuAntiNukeWeapon
local nukeFiredOnGotTarget = false

XSB4302 = ClassUnit(SStructureUnit) {

    Weapons = {
        MissileRack = ClassWeapon(SIFHuAntiNukeWeapon) {},
		MissileRack2 = ClassWeapon(SIFHuAntiNukeWeapon) {},
    },
}

TypeClass = XSB4302