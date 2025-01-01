local ASeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local AeonWeapons = import('/lua/aeonweapons.lua')

local AAAZealotMissileWeapon    = AeonWeapons.AAAZealotMissileWeapon
local ADFCannonQuantumWeapon    = AeonWeapons.ADFCannonQuantumWeapon
local AAMWillOWisp              = AeonWeapons.AAMWillOWisp

AeonWeapons = nil

UAS0202 = ClassUnit(ASeaUnit) {
    Weapons = {
        FrontTurret         = ClassWeapon(ADFCannonQuantumWeapon) {},
        AntiAirMissiles01   = ClassWeapon(AAAZealotMissileWeapon) {},
        AntiAirMissiles02   = ClassWeapon(AAAZealotMissileWeapon) {},
        AntiMissile         = ClassWeapon(AAMWillOWisp) {},
    },

}

TypeClass = UAS0202