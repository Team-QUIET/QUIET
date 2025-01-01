local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

UAB2301 = ClassUnit(AStructureUnit) {

    Weapons = {
        MainGun = ClassWeapon(import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon) {
			FxMuzzleFlash = {
				'/effects/emitters/oblivion_cannon_flash_04_emit.bp',
				'/effects/emitters/oblivion_cannon_flash_05_emit.bp',				
				'/effects/emitters/oblivion_cannon_flash_06_emit.bp',
			},        
        }
    },
}

TypeClass = UAB2301