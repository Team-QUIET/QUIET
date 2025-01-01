local TAirUnit = import('/lua/defaultunits.lua').AirUnit

local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun

UEA0102 = ClassUnit(TAirUnit) {
    PlayDestructionEffects = true,
    DamageEffectPullback = 0.25,
    DestroySeconds = 7.5,

    Weapons = {
        LinkedRailGun = ClassWeapon(TAALinkedRailgun) {
        },
    },
}

TypeClass = UEA0102