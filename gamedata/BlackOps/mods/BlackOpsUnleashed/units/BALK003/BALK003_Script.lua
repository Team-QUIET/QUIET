local AWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon

BALK003 = ClassUnit(AWalkingLandUnit) {    
    Weapons = {
		AAMissile = ClassWeapon(AAAZealotMissileWeapon) {},
    },
}

TypeClass = BALK003