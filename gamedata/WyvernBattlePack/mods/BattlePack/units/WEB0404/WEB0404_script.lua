local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TANTorpedoAngler = WeaponsFile.TANTorpedoAngler

WeaponsFile = nil

local MissileRedirect = import('/lua/defaultantiprojectile.lua').MissileTorpDestroy

local TrashBag = TrashBag
local TrashAdd = TrashBag.Add
local TrashDestroy = TrashBag.Destroy

WEB0404 = ClassUnit(TStructureUnit) {

    Weapons = {
    
        TurretLarge = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.6 },
        
        Turret = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlash = false },

        Torpedo = ClassWeapon(TANTorpedoAngler) { FxMuzzleFlash = false },
    },
	
	OnStopBeingBuilt = function(self,builder,layer)
		
		TStructureUnit.OnStopBeingBuilt(self,builder,layer)

        -- create Torp Defense emitter
        local bp = __blueprints[self.BlueprintID].Defense.MissileTorpDestroy
        
        for _,v in bp.AttachBone do

            local antiMissile1 = MissileRedirect { Owner = self, Radius = bp.Radius, AttachBone = v, RedirectRateOfFire = bp.RedirectRateOfFire }

            TrashAdd( self.Trash, antiMissile1)
            
        end
        
    end,
}

TypeClass = WEB0404