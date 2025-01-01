local CSeaUnit = import('/lua/defaultunits.lua').SeaUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local XCannonWeapon01 = import('/mods/BlackOpsUnleashed/lua/BlackOpsweapons.lua').XCannonWeapon01

local CAAAutocannon             = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CDFProtonCannonWeapon     = CybranWeaponsFile.CDFProtonCannonWeapon
local CANNaniteTorpedoWeapon    = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CAMZapperWeapon02         = CybranWeaponsFile.CAMZapperWeapon02

CybranWeaponsFile = nil

XRS0402= ClassUnit(CSeaUnit) {

    Weapons = {
        MainCannonFront = ClassWeapon(XCannonWeapon01) {},
        MainCannonBack  = ClassWeapon(XCannonWeapon01) {},
        BombardmentGun  = ClassWeapon(CDFProtonCannonWeapon) {},
        SecondaryCannon = ClassWeapon(CDFProtonCannonWeapon) {},
        AAGun           = ClassWeapon(CAAAutocannon) {},
        Zapper          = ClassWeapon(CAMZapperWeapon02) {},
        Torpedo         = ClassWeapon(CANNaniteTorpedoWeapon) {},
    },
}

TypeClass = XRS0402