local CSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local CAAAutocannon             = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CDFProtonCannonWeapon     = CybranWeaponsFile.CDFProtonCannonWeapon
local CANNaniteTorpedoWeapon    = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CAMZapperWeapon           = CybranWeaponsFile.CAMZapperWeapon

CybranWeaponsFile = nil

BRMST3BOM = ClassUnit(CSeaUnit) {

    Weapons = {
	
        Cannon  = ClassWeapon(CDFProtonCannonWeapon) {},
        Torpedo = ClassWeapon(CANNaniteTorpedoWeapon) {},
        AAGun   = ClassWeapon(CAAAutocannon) {},
        Zapper  = ClassWeapon(CAMZapperWeapon) {},
		
    },
}
TypeClass = BRMST3BOM