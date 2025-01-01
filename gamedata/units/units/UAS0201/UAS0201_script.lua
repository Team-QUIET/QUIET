local ASeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local AeonWeapons = import('/lua/aeonweapons.lua')

local ADFCannonOblivionWeapon       = AeonWeapons.ADFCannonOblivionWeapon
local AANChronoTorpedoWeapon        = AeonWeapons.AANChronoTorpedoWeapon
local AIFQuasarAntiTorpedoWeapon    = AeonWeapons.AIFQuasarAntiTorpedoWeapon

AeonWeapons = nil


UAS0201 = ClassUnit(ASeaUnit) {

    Weapons = {
        FrontTurret = ClassWeapon(ADFCannonOblivionWeapon) {},

        Torpedo = ClassWeapon(AANChronoTorpedoWeapon) {},

        AntiTorpedo1 = ClassWeapon(AIFQuasarAntiTorpedoWeapon) {},
        AntiTorpedo2 = ClassWeapon(AIFQuasarAntiTorpedoWeapon) {},
        AntiTorpedo3 = ClassWeapon(AIFQuasarAntiTorpedoWeapon) {},
    },
}

TypeClass = UAS0201