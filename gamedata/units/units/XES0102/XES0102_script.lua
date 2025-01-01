local TSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler

local TorpedoDecoy = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

WeaponFile = nil

XES0102 = ClassUnit(TSeaUnit) {

    Weapons = {
        Torpedo = ClassWeapon(TANTorpedoAngler) { FxMuzzleFlashScale = 0.5, },
        
        AntiTorpedoLeft = ClassWeapon(TorpedoDecoy) { FxMuzzleFlash = false },
        AntiTorpedoRight = ClassWeapon(TorpedoDecoy) { FxMuzzleFlash = false },
    },    
}

TypeClass = XES0102