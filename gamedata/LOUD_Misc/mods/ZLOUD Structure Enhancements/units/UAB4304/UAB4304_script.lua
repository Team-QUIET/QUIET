local ARadarJammerUnit = import('/lua/aeonunits.lua').ARadarJammerUnit

UAB4304 = ClassUnit(ARadarJammerUnit) {
	
    IntelEffects = {
		{ Bones = {'UAB4203'}, Offset = {0,3.5,0}, Type = 'Jammer01'},
    },
	
}

TypeClass = UAB4304