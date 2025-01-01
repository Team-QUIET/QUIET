local TSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local AeonWeapons = import('/lua/aeonweapons.lua')
local AIFQuasarAntiTorpedoWeapon = AeonWeapons.AIFQuasarAntiTorpedoWeapon

local WeaponsFile = import('/lua/terranweapons.lua')

local TAMPhalanxWeapon      = WeaponsFile.TAMPhalanxWeapon
local TDFHiroPlasmaCannon   = WeaponsFile.TDFHiroPlasmaCannon
local TANTorpedoAngler      = WeaponsFile.TANTorpedoAngler

AeonWeapons = nil
WeaponsFile = nil

UES0302 = ClassUnit(TSeaUnit) {

    Weapons = {
	
        HiroCannon = ClassWeapon(TDFHiroPlasmaCannon) {},
        Torpedo = ClassWeapon(TANTorpedoAngler) {},
        PhalanxGun = ClassWeapon(TAMPhalanxWeapon) {},
        AntiTorpedo = ClassWeapon(AIFQuasarAntiTorpedoWeapon) {},
    },
	
}
TypeClass = UES0302