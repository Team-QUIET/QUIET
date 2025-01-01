local CSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local CDFProtonCannonWeapon     = CybranWeaponsFile.CDFProtonCannonWeapon
local CAAAutocannon             = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CANNaniteTorpedoWeapon    = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CAMZapperWeapon           = CybranWeaponsFile.CAMZapperWeapon

CybranWeaponsFile = nil

URS0302 = ClassUnit(CSeaUnit) {

    Weapons = {
	
        Cannon  = ClassWeapon(CDFProtonCannonWeapon) {},
        AAGun   = ClassWeapon(CAAAutocannon) {},
        Torpedo = ClassWeapon(CANNaniteTorpedoWeapon) {},
        Zapper  = ClassWeapon(CAMZapperWeapon) {},

    },
}
TypeClass = URS0302