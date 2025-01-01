local CLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')

local CDFElectronBolterWeapon   = CybranWeaponsFile.CDFElectronBolterWeapon
local CDFMissileMesonWeapon     = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local TorpedoLauncher           = CybranWeaponsFile.CANNaniteTorpedoWeapon

CybranWeaponsFile = nil


URL0203 = ClassUnit(CLandUnit) {

    Weapons = {
        Bolter  = ClassWeapon(CDFElectronBolterWeapon) {},
        Rocket  = ClassWeapon(CDFMissileMesonWeapon) {},
        Torpedo = ClassWeapon(TorpedoLauncher) {},
    },
    
}
TypeClass = URL0203