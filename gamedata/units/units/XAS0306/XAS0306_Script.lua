local ASeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local AIFMissileTacticalSerpentine02Weapon = import('/lua/aeonweapons.lua').AIFMissileTacticalSerpentine02Weapon
local AIFQuasarAntiTorpedoWeapon = import('/lua/aeonweapons.lua').AIFQuasarAntiTorpedoWeapon

XAS0306 = ClassUnit(ASeaUnit) {

    FxDamageScale = 2,
    DestructionTicks = 350,

    Weapons = {
        AntiTorpedo = ClassWeapon(AIFQuasarAntiTorpedoWeapon) {},
        MissileRack = ClassWeapon(AIFMissileTacticalSerpentine02Weapon) {},
    },
}

TypeClass = XAS0306