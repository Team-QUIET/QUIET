local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CAAAutocannon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

URB2104 = ClassUnit(CStructureUnit) {

    Weapons = {
        AAGun = ClassWeapon(CAAAutocannon) { FxMuzzleScale = 2.25 },
    },
	
}

TypeClass = URB2104
