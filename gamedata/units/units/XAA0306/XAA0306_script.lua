local AAirUnit = import('/lua/defaultunits.lua').AirUnit

local AANTorpedoCluster = import('/lua/aeonweapons.lua').AANChronoTorpedoWeapon

XAA0306 = ClassUnit(AAirUnit) {

    Weapons = {
        ClusterTorpedo = ClassWeapon(AANTorpedoCluster) { FxMuzzleFlash = false },
    },
	
}

TypeClass = XAA0306