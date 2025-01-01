local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local CDFHvyProtonCannonWeapon          = CybranWeaponsFile.CDFHvyProtonCannonWeapon
local CDFHeavyMicrowaveLaserGenerator   = CybranWeaponsFile.CDFHeavyMicrowaveLaserGeneratorCom
local CAABurstCloudFlakArtilleryWeapon  = CybranWeaponsFile.CAABurstCloudFlakArtilleryWeapon

CybranWeaponsFile = nil

WRL0404 = ClassUnit(CWalkingLandUnit) {

    Weapons = {
        MainGun = ClassWeapon(CDFHvyProtonCannonWeapon) {},
		
        RightLaserTurret = ClassWeapon(CDFHeavyMicrowaveLaserGenerator) {},
        LeftLaserTurret = ClassWeapon(CDFHeavyMicrowaveLaserGenerator) {},
		
        AAGun1 = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
        AAGun2 = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
        AAGun3 = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
        AAGun4 = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
    },
}

TypeClass = WRL0404