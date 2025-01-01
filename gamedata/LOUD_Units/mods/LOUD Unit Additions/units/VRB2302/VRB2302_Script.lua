local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CAAMissileNaniteWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

VRB2302 = ClassUnit(CStructureUnit) {

    Weapons = {
	
        Missile01 = ClassWeapon(CAAMissileNaniteWeapon) {},
		
    },
	
}

TypeClass = VRB2302