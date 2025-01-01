local CSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon

CybranWeaponsFile = nil

URS0103 = ClassUnit(CSeaUnit) {

    DestructionTicks = 120,

    Weapons = {
        ProtonCannon = ClassWeapon(CDFProtonCannonWeapon) {},
        AAGun = ClassWeapon(CAAAutocannon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
	
        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
		
        self.Trash:Add(CreateRotator(self, 'Cybran_Radar', 'y', nil, 90, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Back_Radar', 'y', nil, -360, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Front_Radar', 'y', nil, -180, 0, 0))
		
    end,
}

TypeClass = URS0103
