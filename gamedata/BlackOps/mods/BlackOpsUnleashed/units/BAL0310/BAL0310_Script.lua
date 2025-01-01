local AHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFDisruptorWeapon = import('/lua/aeonweapons.lua').ADFDisruptorWeapon
local ADFCannonQuantumWeapon = import('/lua/aeonweapons.lua').ADFCannonQuantumWeapon

BAL0310 = ClassUnit(AHoverLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFDisruptorWeapon) {},
        SideGuns = ClassWeapon(ADFCannonQuantumWeapon) {},
    },
}

TypeClass = BAL0310