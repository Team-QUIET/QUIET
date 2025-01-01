local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local CIFMissileLoaTacticalWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaTacticalWeapon

BRL0307 = ClassUnit(CWalkingLandUnit) {
    Weapons = {
        MissileRack = ClassWeapon(CIFMissileLoaTacticalWeapon) {},
    },
}

TypeClass = BRL0307
