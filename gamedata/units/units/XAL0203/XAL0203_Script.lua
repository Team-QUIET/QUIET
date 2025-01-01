local AHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFQuantumAutogunWeapon = import('/lua/aeonweapons.lua').ADFQuantumAutogunWeapon

XAL0203 = ClassUnit(AHoverLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFQuantumAutogunWeapon) {}
    },
}
TypeClass = XAL0203