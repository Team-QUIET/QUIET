local AeonWeapons = import('/lua/aeonweapons.lua')

local ASeaUnit = import('/lua/defaultunits.lua').SeaUnit

local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon

WAS0332 = ClassUnit(ASeaUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFCannonQuantumWeapon) {},

        AntiAirMissiles = ClassWeapon(AAAZealotMissileWeapon) {},
    },

    BackWakeEffect = {},
}

TypeClass = WAS0332