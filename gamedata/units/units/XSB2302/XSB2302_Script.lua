local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit

local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusArtilleryCannon

XSB2302 = ClassUnit(SStructureUnit) {

    Weapons = {
	
        MainGun = ClassWeapon(SIFSuthanusArtilleryCannon) {
		
            CreateProjectileAtMuzzle = function(self, muzzle)
			
                local proj = SIFSuthanusArtilleryCannon.CreateProjectileAtMuzzle(self, muzzle)
                local data = self:GetBlueprint().ShieldDamage
				
                if proj and not proj:BeenDestroyed() then
                    proj:PassData(data)
                end
				
            end,
        },
    },
}

TypeClass = XSB2302