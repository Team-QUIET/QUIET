local CLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CIFMissileLoaWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaWeapon

URL0111 = ClassUnit(CLandUnit) {

    Weapons = {
        MissileRack = ClassWeapon(CIFMissileLoaWeapon) {},
    },
	
}

TypeClass = URL0111
