local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

BEL0308 = ClassUnit(TWalkingLandUnit) 
{
    Weapons = {
        MainGun = ClassWeapon(TIFArtilleryWeapon) {},
		GaussCannons = ClassWeapon(TDFGaussCannonWeapon) {},
    },
}

TypeClass = BEL0308