local ALandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFCannonOblivionWeapon = import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon

SAL0311 = ClassUnit(ALandUnit) {

    Weapons = {
        MainGun = ClassWeapon(ADFCannonOblivionWeapon) {FxChargeMuzzleFlashScale = 0.3}
    },
}

TypeClass = SAL0311
