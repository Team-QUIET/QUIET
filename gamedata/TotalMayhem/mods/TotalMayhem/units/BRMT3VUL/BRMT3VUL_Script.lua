local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local WeaponsFile = import('/lua/cybranweapons.lua')

local CDFElectronBolterWeapon   = WeaponsFile.CDFElectronBolterWeapon
local CCannonMolecularWeapon    = WeaponsFile.CCannonMolecularWeapon

local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFLandGaussCannonWeapon

WeaponsFile = nil

local MissileRedirect = import('/lua/defaultantiprojectile.lua').MissileRedirect

BRMT3VUL = ClassUnit(CWalkingLandUnit) {

    Weapons = {

        rockets     = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0.4 },
        armweapon   = ClassWeapon(CCannonMolecularWeapon) { FxMuzzleFlashScale = 0.8 },
        HeavyBolter = ClassWeapon(CDFElectronBolterWeapon) {},
        robottalk   = ClassWeapon(TDFGaussCannonWeapon) { FxMuzzleFlashScale = 0},
    },

    OnStopBeingBuilt = function(self,builder,layer)
	
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
		
        local bp = self:GetBlueprint().Defense.AntiMissile
		
        local antiMissile = MissileRedirect { Owner = self, Radius = bp.Radius, AttachBone = bp.AttachBone, RedirectRateOfFire = bp.RedirectRateOfFire }
		
        self.Trash:Add(antiMissile)
        self.UnitComplete = true
    end,
    
}

TypeClass = BRMT3VUL