local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TAMInterceptorWeapon = import('/lua/terranweapons.lua').TAMInterceptorWeapon
local nukeFiredOnGotTarget = false

UEB4302 = ClassUnit(TStructureUnit) {
    Weapons = {
        AntiNuke = ClassWeapon(TAMInterceptorWeapon) {},
		AntiNuke2 = ClassWeapon(TAMInterceptorWeapon) {},
    },
}

TypeClass = UEB4302