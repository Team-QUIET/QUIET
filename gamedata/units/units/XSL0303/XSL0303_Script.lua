local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local WeaponsFile = import('/lua/seraphimweapons.lua')

local SDFThauCannon     = WeaponsFile.SDFThauCannon
local SDFAireauBolter   = WeaponsFile.SDFAireauBolterWeapon
local SANAnaitTorpedo   = WeaponsFile.SANAnaitTorpedo

WeaponsFile = nil

XSL0303 = ClassUnit(SLandUnit) {

    Weapons = {
	
        Turret = ClassWeapon(SDFThauCannon) {},

        LeftTurret = ClassWeapon(SDFAireauBolter) {},
        RightTurret = ClassWeapon(SDFAireauBolter) {},
		
        Torpedo = ClassWeapon(SANAnaitTorpedo) {},		
    },
}

TypeClass = XSL0303