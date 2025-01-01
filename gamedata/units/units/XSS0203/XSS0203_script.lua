local SSubUnit =  import('/lua/defaultunits.lua').SubUnit

local SWeapons = import('/lua/seraphimweapons.lua')

local Torpedo                       = SWeapons.SANAnaitTorpedo
local SDFAjelluAntiTorpedoDefense   = SWeapons.SDFAjelluAntiTorpedoDefense
local SDFOhCannon                   = SWeapons.SDFOhCannon02

SWeapons = nil

XSS0203 = ClassUnit(SSubUnit) {

    Weapons = {
        Torpedo     = ClassWeapon(Torpedo) {},
        AntiTorpedo = ClassWeapon(SDFAjelluAntiTorpedoDefense) {},
        Cannon      = ClassWeapon(SDFOhCannon) {},		
    },

    OnStopBeingBuilt = function(self,builder,layer)
	
        SSubUnit.OnStopBeingBuilt(self,builder,layer)
		
        self.CannonAnim = CreateAnimator(self)
        self.Trash:Add(self.CannonAnim)
		
        local bp = self:GetBlueprint()
		
        self.CannonAnim:PlayAnim(bp.Display.CannonOpenAnimation)
        self.CannonAnim:SetRate(bp.Display.CannonOpenRate or 1)

    end,
	
}

TypeClass = XSS0203