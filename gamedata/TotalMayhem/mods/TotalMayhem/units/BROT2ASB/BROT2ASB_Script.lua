local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local TMAmizurabluelaserweapon = import('/mods/TotalMayhem/lua/TMAeonWeapons.lua').TMAmizurabluelaserweapon

BROT2ASB = ClassUnit(CWalkingLandUnit) {

    Weapons = {
        laser = ClassWeapon(TMAmizurabluelaserweapon) { FxMuzzleFlashScale = 0.1 },  
    },
}

TypeClass = BROT2ASB