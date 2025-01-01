local THoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TRiotGunMuzzleFxTank = import('/lua/EffectTemplates.lua').TRiotGunMuzzleFxTank
local TDFRiotWeapon = import('/lua/terranweapons.lua').TDFRiotWeapon

UEL0203 = ClassUnit(THoverLandUnit) {
    Weapons = {
        Riotgun01 = ClassWeapon(TDFRiotWeapon) { FxMuzzleFlash = TRiotGunMuzzleFxTank },
    },
}

TypeClass = UEL0203