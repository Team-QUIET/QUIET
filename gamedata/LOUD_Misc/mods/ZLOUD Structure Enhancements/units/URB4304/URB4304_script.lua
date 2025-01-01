local CRadarJammerUnit = import('/lua/defaultunits.lua').RadarJammerUnit

URB4304 = ClassUnit(CRadarJammerUnit) {

    IntelEffects = {
		{ Bones = {'URB4203'}, Offset = { 0, 0, 4 }, Type = 'Jammer01'},
    },

}

TypeClass = URB4304
