local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon

UEL0205 = ClassUnit(TLandUnit) {
    Weapons = {
        AAGun = ClassWeapon(TAAFlakArtilleryCannon) {
            PlayOnlyOneSoundCue = true,
        },
    },
}

TypeClass = UEL0205