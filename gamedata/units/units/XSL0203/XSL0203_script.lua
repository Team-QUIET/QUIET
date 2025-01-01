local SHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SDFThauCannon = import('/lua/seraphimweapons.lua').SDFThauCannon

XSL0203 = ClassUnit(SHoverLandUnit) {
    Weapons = {
        TauCannon01 = ClassWeapon(SDFThauCannon){
			FxMuzzleFlashScale = 0.5,
        },
    },
}
TypeClass = XSL0203