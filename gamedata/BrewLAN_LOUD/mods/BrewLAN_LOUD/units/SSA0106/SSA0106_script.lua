local SAirUnit = import('/lua/defaultunits.lua').AirUnit

local SANHeavyCavitationTorpedo = import('/lua/seraphimweapons.lua').SANHeavyCavitationTorpedo

SSA0106 = ClassUnit(SAirUnit) {

    Weapons = {
        Torpedo = ClassWeapon(SANHeavyCavitationTorpedo) {},
    },
}

TypeClass = SSA0106
