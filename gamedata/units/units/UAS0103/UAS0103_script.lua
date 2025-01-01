local SeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local AeonWeapons = import('/lua/aeonweapons.lua')

local ADFCannonQuantumWeapon        = AeonWeapons.ADFCannonQuantumWeapon
local AIFQuasarAntiTorpedoWeapon    = AeonWeapons.AIFQuasarAntiTorpedoWeapon

AeonWeapons = nil

local AQuantumCannonMuzzle02 = import('/lua/EffectTemplates.lua').AQuantumCannonMuzzle02

UAS0103 = ClassUnit(SeaUnit) {

    Weapons = {
	
        DeckGuns = ClassWeapon(ADFCannonQuantumWeapon) { FxMuzzleFlash = AQuantumCannonMuzzle02 },

        AntiTorpedo = ClassWeapon(AIFQuasarAntiTorpedoWeapon) {},
    },
	
}

TypeClass = UAS0103
