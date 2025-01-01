local ALandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFCannonOblivionWeapon = import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon02
local SAMElectrumMissileDefense = import ('/lua/seraphimweapons.lua').SAMElectrumMissileDefense

SAL0401 = ClassUnit(ALandUnit) {
    Weapons = {
        MainGun     = ClassWeapon(ADFCannonOblivionWeapon) {},
        AntiMissile = ClassWeapon(SAMElectrumMissileDefense) {},
    },
}
TypeClass = SAL0401
