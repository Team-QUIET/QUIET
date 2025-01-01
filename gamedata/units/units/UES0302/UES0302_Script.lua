local TSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TAALinkedRailgun      = WeaponsFile.TAALinkedRailgun
local TAMPhalanxWeapon      = WeaponsFile.TAMPhalanxWeapon
local TDFGaussCannonWeapon  = WeaponsFile.TDFShipGaussCannonWeapon
local TIFSmartCharge        = WeaponsFile.TIFSmartCharge

WeaponsFile = nil

UES0302 = ClassUnit(TSeaUnit) {

    Weapons = {
        Turret      = ClassWeapon(TDFGaussCannonWeapon) {},	
        AAGun       = ClassWeapon(TAALinkedRailgun) {},
        PhalanxGun  = ClassWeapon(TAMPhalanxWeapon) {},
        AntiTorpedo = ClassWeapon(TIFSmartCharge) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
	
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
		
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, -45))
        self.Trash:Add(CreateRotator(self, 'Spinner02', 'y', nil, 90))
		
    end,
}

TypeClass = UES0302