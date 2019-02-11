--  /lua/AI/AIBuilders/Loud_Perimeter_Defense_Templates.lua
-- this file determines the placement of structures at a perimeter position (there are 12 positions around any base)

PerimeterDefenseTemplates = {

-- Just a note here - the standard orientation of this template is EAST (and not SOUTH like the templates for other base facilities - oops)
-- these blocks should get rotated depending upon if the FRONT is facing the same way and furthermore - the sides should rotate 90 degrees
-- to face the correct direction.
-- the rotation base value is 0 to 3 (0 = South, 1 = West, 2 = North, 3 = East) as the template rotation code will do that many
-- transforms on these numbers
# UEF Perimeter Defense Template
    {
        {
            {'T1AADefense'},
            {-2, 2 },
        },
        {
            {'T1GroundDefense'},
            { 2, 2 },
        },
		{
			{'T1Artillery'},
			{ 0, -2},
		},
        {
            {'T1MassCreation'},
            { 5, 3 },
            {-5, 3 },
        },
        {
            {'T3EnergyProduction'},
            { 0, 0 },
        },
        {
            {'T2GroundDefense','T3GroundDefense'},
            { 0, 8 },
            { 5, 8 },
            {-5, 8 },
            { 10, 8 },
			{-10, 8 },
        },
        {
            {'T2AADefense','T3AADefense'},
            { 3, -8 },
            {-3, -8 },
            { 9, -5 },
			{-9, -5 },
        },
        {
            {'T2Artillery','T2StrategicMissile'},
			{ 3, -5 },
			{-3, -5 },
            { 0, -5 },
        },
        {
            {'T2MissileDefense'},
            {-11,-5 },
            { 11,-5 },
        },
        {
            {'T2ShieldDefense','T3ShieldDefense'},
            { 9, 1 },
			{-9, 1 },
		},
		{
			{'T3StrategicMissileDefense'},
			{ 12,-10 },
		},
		{
			{'T4AADefense'},
			{ 8,-10 },
		},
		{
			{'T4GroundDefense'},
			{-8,-10 },
		},
		{
			{'T3Storage'},
			{ 5,-1 },
			{ 5, 1 },
			{ 5, 3 },
			{-5, 3 },
			{-5, 1 },
			{-5,-1 },
			{ 7,-3 },
			{ 9,-3 },
			{ 11,-3 },
			{-11,-3 },
			{-9,-3 },
			{-7,-3 },
		},
		{
			{'Wall','T2Wall'},
			{ 5, -3 },
			{ 5, -2 },
			{ 5, -1 },
			{ 5, 0 },
			{ 5, 1 },
			{ 5, 2 },
			{ 5, 3 },
			{ 6, 3 },
			{ 7, 3 },
			{ 7, 4 },
			{ 7, 5 },
			{ 7, 6 },
			{ 7, 7 },
			{ 6, 7 },
			{ 6, -3 },
			{ 7, -3 },
			{ 7, -4 },
			{ 7, -5 },
			{ 7, -6 },
			{ 7, -7 },
			{ 6, -7 },
			{ 5, -7 },
			{ 5, -8 },
			{ 5, -9 },
			{ 5, -10 },
			{ 5, -11 },
			{ 5, -12 },
			{ 5, -13 },
			{ 5, 7 },
			{ 5, 8 },
			{ 5, 9 },
			{ 5, 10 },
			{ 5, 11 },
			{ 5, 12 },
			{ 5, 13 },
			{ 4, 13 },
			{ 3, 13 },
			{ 2, 13 },
			{ 1, 13 },
			{ 0, 13 },
			{ -1, 13 },
			{ -2, 13 },
			{ -3, 13 },
			{ -4, 13 },
			{ -5, 13 },
			{ -6, 13 },
			{ 4, -13 },
			{ 3, -13 },
			{ 2, -13 },
			{ 1, -13 },
			{ 0, -13 },
			{ -1, -13 },
			{ -2, -13 },
			{ -3, -13 },
			{ -4, -13 },
			{ -5, -13 },
			{ -6, -13 },
			{ -7, -13 },
			{ -7, -12 },
			{ -7, -11 },
			{ -7, -10 },
			{ -7, -9 },
			{ -7, -8 },
			{ -7, -7 },
			{ -7, -6 },
			{ -7, -5 },
			{ -7, 13 },
			{ -7, 12 },
			{ -7, 11 },
			{ -7, 10 },
			{ -7, 9 },
			{ -7, 8 },
			{ -7, 7 },
			{ -7, 6 },
			{ -7, 5 },
			{ -8, 5 },
			{ -9, 5 },
			{ -10, 5 },
			{ -10, 4 },
			{ -10, 3 },
			{ -10, 2 },
			{ -8, -5 },
			{ -9, -5 },
			{ -10, -5 },
			{ -10, -4 },
			{ -10, -3 },
			{ -10, -2 },
		},
    },
# Aeon Perimeter Defense Template
   {
        {
            {'T1AADefense'},
            {-2, 2 },
        },
        {
            {'T1GroundDefense'},
            { 2, 2 },
        },
		{
			{'T1Artillery'},
			{ 0, -2},
		},		
        {
            {'T1MassCreation'},
            { 5, 3 },
            {-5, 3 },
        },
        {
            {'T3EnergyProduction'},
            { 0, 0 },
        },
        {
            {'T2GroundDefense','T3GroundDefense'},
            { 0, 8 },
            { 5, 8 },
            {-5, 8 },
            { 10, 8 },
			{-10, 8 },
        },
        {
            {'T2AADefense','T3AADefense'},
            { 3, -8 },
            {-3, -8 },
            { 9, -5 },
			{-9, -5 },
        },
        {
            {'T2Artillery','T2StrategicMissile'},
			{ 3, -5 },
			{-3, -5 },
            { 0, -5 },
        },
        {
            {'T2MissileDefense'},
            {-11,-5 },
            { 11,-5 },
        },
        {
            {'T2ShieldDefense','T3ShieldDefense'},
            { 9, 1 },
			{-9, 1 },
		},
		{
			{'T3StrategicMissileDefense'},
			{ 12,-10 },
		},
		{
			{'T4AADefense'},
			{ 8,-10 },
		},
		{
			{'T4GroundDefense'},
			{-8,-10 },
		},
		{
			{'T3Storage'},
			{ 5,-1 },
			{ 5, 1 },
			{ 5, 3 },
			{-5, 3 },
			{-5, 1 },
			{-5,-1 },
			{ 7,-3 },
			{ 9,-3 },
			{ 11,-3 },
			{-11,-3 },
			{-9,-3 },
			{-7,-3 },
		},
		{
			{'Wall','T2Wall'},
			{ 5, -3 },
			{ 5, -2 },
			{ 5, -1 },
			{ 5, 0 },
			{ 5, 1 },
			{ 5, 2 },
			{ 5, 3 },
			{ 6, 3 },
			{ 7, 3 },
			{ 7, 4 },
			{ 7, 5 },
			{ 7, 6 },
			{ 7, 7 },
			{ 6, 7 },
			{ 6, -3 },
			{ 7, -3 },
			{ 7, -4 },
			{ 7, -5 },
			{ 7, -6 },
			{ 7, -7 },
			{ 6, -7 },
			{ 5, -7 },
			{ 5, -8 },
			{ 5, -9 },
			{ 5, -10 },
			{ 5, -11 },
			{ 5, -12 },
			{ 5, -13 },
			{ 5, 7 },
			{ 5, 8 },
			{ 5, 9 },
			{ 5, 10 },
			{ 5, 11 },
			{ 5, 12 },
			{ 5, 13 },
			{ 4, 13 },
			{ 3, 13 },
			{ 2, 13 },
			{ 1, 13 },
			{ 0, 13 },
			{ -1, 13 },
			{ -2, 13 },
			{ -3, 13 },
			{ -4, 13 },
			{ -5, 13 },
			{ -6, 13 },
			{ 4, -13 },
			{ 3, -13 },
			{ 2, -13 },
			{ 1, -13 },
			{ 0, -13 },
			{ -1, -13 },
			{ -2, -13 },
			{ -3, -13 },
			{ -4, -13 },
			{ -5, -13 },
			{ -6, -13 },
			{ -7, -13 },
			{ -7, -12 },
			{ -7, -11 },
			{ -7, -10 },
			{ -7, -9 },
			{ -7, -8 },
			{ -7, -7 },
			{ -7, -6 },
			{ -7, -5 },
			{ -7, 13 },
			{ -7, 12 },
			{ -7, 11 },
			{ -7, 10 },
			{ -7, 9 },
			{ -7, 8 },
			{ -7, 7 },
			{ -7, 6 },
			{ -7, 5 },
			{ -8, 5 },
			{ -9, 5 },
			{ -10, 5 },
			{ -10, 4 },
			{ -10, 3 },
			{ -10, 2 },
			{ -8, -5 },
			{ -9, -5 },
			{ -10, -5 },
			{ -10, -4 },
			{ -10, -3 },
			{ -10, -2 },
		},
    },
# Cybran Perimeter Defense Template
   {
        {
            {'T1AADefense'},
            {-2, 2 },
        },
        {
            {'T1GroundDefense'},
            { 2, 2 },
        },
		{
			{'T1Artillery'},
			{ 0, -2},
		},		
        {
            {'T1MassCreation'},
            { 5, 3 },
            {-5, 3 },
        },
        {
            {'T3EnergyProduction'},
            { 0, 0 },
        },
        {
            {'T2GroundDefense','T3GroundDefense'},
            { 0, 8 },
            { 5, 8 },
            {-5, 8 },
            { 10, 8 },
			{-10, 8 },
        },
        {
            {'T2AADefense','T3AADefense'},
            { 3, -8 },
            {-3, -8 },
            { 9, -5 },
			{-9, -5 },
        },
        {
            {'T2Artillery','T2StrategicMissile'},
			{ 3, -5 },
			{-3, -5 },
            { 0, -5 },
        },
        {
            {'T2MissileDefense'},
            {-11,-5 },
            { 11,-5 },
        },
        {
            {'T2ShieldDefense','T3ShieldDefense'},
            { 9, 1 },
			{-9, 1 },
		},
		{
			{'T3StrategicMissileDefense'},
			{ 12,-10 },
		},
		{
			{'T4AADefense'},
			{ 8,-10 },
		},
		{
			{'T4GroundDefense'},
			{-8,-10 },
		},
		{
			{'T3Storage'},
			{ 5,-1 },
			{ 5, 1 },
			{ 5, 3 },
			{-5, 3 },
			{-5, 1 },
			{-5,-1 },
			{ 7,-3 },
			{ 9,-3 },
			{ 11,-3 },
			{-11,-3 },
			{-9,-3 },
			{-7,-3 },
		},
		{
			{'Wall','T2Wall'},
			{ 5, -3 },
			{ 5, -2 },
			{ 5, -1 },
			{ 5, 0 },
			{ 5, 1 },
			{ 5, 2 },
			{ 5, 3 },
			{ 6, 3 },
			{ 7, 3 },
			{ 7, 4 },
			{ 7, 5 },
			{ 7, 6 },
			{ 7, 7 },
			{ 6, 7 },
			{ 6, -3 },
			{ 7, -3 },
			{ 7, -4 },
			{ 7, -5 },
			{ 7, -6 },
			{ 7, -7 },
			{ 6, -7 },
			{ 5, -7 },
			{ 5, -8 },
			{ 5, -9 },
			{ 5, -10 },
			{ 5, -11 },
			{ 5, -12 },
			{ 5, -13 },
			{ 5, 7 },
			{ 5, 8 },
			{ 5, 9 },
			{ 5, 10 },
			{ 5, 11 },
			{ 5, 12 },
			{ 5, 13 },
			{ 4, 13 },
			{ 3, 13 },
			{ 2, 13 },
			{ 1, 13 },
			{ 0, 13 },
			{ -1, 13 },
			{ -2, 13 },
			{ -3, 13 },
			{ -4, 13 },
			{ -5, 13 },
			{ -6, 13 },
			{ 4, -13 },
			{ 3, -13 },
			{ 2, -13 },
			{ 1, -13 },
			{ 0, -13 },
			{ -1, -13 },
			{ -2, -13 },
			{ -3, -13 },
			{ -4, -13 },
			{ -5, -13 },
			{ -6, -13 },
			{ -7, -13 },
			{ -7, -12 },
			{ -7, -11 },
			{ -7, -10 },
			{ -7, -9 },
			{ -7, -8 },
			{ -7, -7 },
			{ -7, -6 },
			{ -7, -5 },
			{ -7, 13 },
			{ -7, 12 },
			{ -7, 11 },
			{ -7, 10 },
			{ -7, 9 },
			{ -7, 8 },
			{ -7, 7 },
			{ -7, 6 },
			{ -7, 5 },
			{ -8, 5 },
			{ -9, 5 },
			{ -10, 5 },
			{ -10, 4 },
			{ -10, 3 },
			{ -10, 2 },
			{ -8, -5 },
			{ -9, -5 },
			{ -10, -5 },
			{ -10, -4 },
			{ -10, -3 },
			{ -10, -2 },
		},
    },
# Seraphim Perimeter Defense Template
   {
        {
            {'T1AADefense'},
            {-2, 2 },
        },
        {
            {'T1GroundDefense'},
            { 2, 2 },
        },
		{
			{'T1Artillery'},
			{ 0, -2},
		},		
        {
            {'T1MassCreation'},
            { 5, 3 },
            {-5, 3 },
        },
        {
            {'T3EnergyProduction'},
            { 0, 0 },
        },
		{
			{'RestorationField'},
			{ 0, -13 },
		},
        {
            {'T2GroundDefense','T3GroundDefense'},
            { 0, 8 },
            { 5, 8 },
            {-5, 8 },
            { 10, 8 },
			{-10, 8 },
        },
        {
            {'T2AADefense','T3AADefense'},
            { 3, -8 },
            {-3, -8 },
            { 9, -5 },
			{-9, -5 },
        },
        {
            {'T2Artillery','T2StrategicMissile'},
			{ 3, -5 },
			{-3, -5 },
            { 0, -5 },
        },
        {
            {'T2MissileDefense'},
            {-11,-5 },
            { 11,-5 },
        },
        {
            {'T2ShieldDefense','T3ShieldDefense'},
            { 9, 1 },
			{-9, 1 },
		},
		{
			{'T3StrategicMissileDefense'},
			{ 12,-10 },
		},
		{
			{'T4AADefense'},
			{ 8,-10 },
		},
		{
			{'T4GroundDefense'},
			{-8,-10 },
		},
		{
			{'T3Storage'},
			{ 5,-1 },
			{ 5, 1 },
			{ 5, 3 },
			{-5, 3 },
			{-5, 1 },
			{-5,-1 },
			{ 7,-3 },
			{ 9,-3 },
			{ 11,-3 },
			{-11,-3 },
			{-9,-3 },
			{-7,-3 },
		},
		{
			{'Wall','T2Wall'},
			{ 5, -3 },
			{ 5, -2 },
			{ 5, -1 },
			{ 5, 0 },
			{ 5, 1 },
			{ 5, 2 },
			{ 5, 3 },
			{ 6, 3 },
			{ 7, 3 },
			{ 7, 4 },
			{ 7, 5 },
			{ 7, 6 },
			{ 7, 7 },
			{ 6, 7 },
			{ 6, -3 },
			{ 7, -3 },
			{ 7, -4 },
			{ 7, -5 },
			{ 7, -6 },
			{ 7, -7 },
			{ 6, -7 },
			{ 5, -7 },
			{ 5, -8 },
			{ 5, -9 },
			{ 5, -10 },
			{ 5, -11 },
			{ 5, -12 },
			{ 5, -13 },
			{ 5, 7 },
			{ 5, 8 },
			{ 5, 9 },
			{ 5, 10 },
			{ 5, 11 },
			{ 5, 12 },
			{ 5, 13 },
			{ 4, 13 },
			{ 3, 13 },
			{ 2, 13 },
			{ 1, 13 },
			{ 0, 13 },
			{ -1, 13 },
			{ -2, 13 },
			{ -3, 13 },
			{ -4, 13 },
			{ -5, 13 },
			{ -6, 13 },
			{ 4, -13 },
			{ 3, -13 },
			{ 2, -13 },
			{ 1, -13 },
			{ 0, -13 },
			{ -1, -13 },
			{ -2, -13 },
			{ -3, -13 },
			{ -4, -13 },
			{ -5, -13 },
			{ -6, -13 },
			{ -7, -13 },
			{ -7, -12 },
			{ -7, -11 },
			{ -7, -10 },
			{ -7, -9 },
			{ -7, -8 },
			{ -7, -7 },
			{ -7, -6 },
			{ -7, -5 },
			{ -7, 13 },
			{ -7, 12 },
			{ -7, 11 },
			{ -7, 10 },
			{ -7, 9 },
			{ -7, 8 },
			{ -7, 7 },
			{ -7, 6 },
			{ -7, 5 },
			{ -8, 5 },
			{ -9, 5 },
			{ -10, 5 },
			{ -10, 4 },
			{ -10, 3 },
			{ -10, 2 },
			{ -8, -5 },
			{ -9, -5 },
			{ -10, -5 },
			{ -10, -4 },
			{ -10, -3 },
			{ -10, -2 },
		},
    },
}
	
NavalPerimeterDefenseTemplate = {
# UEF T2 Naval Perimeter Defense Template
    {
        {{'T2Artillery','T2AADefense'},
			{-3,-5 },
			{-3, 5 },
		},
		{{'T3AADefense'},
			{ 4,-5 },
			{ 4, 6 },
		},
		{{'T2GroundDefense','T2MissileDefense'},
			{-3, 0 },
			{ 4, 0 },
		},
		{{'T2NavalDefense'},
            { 0,-5 },
			{ 0, 5 },
		},
		{{'T3NavalDefense'},
			{ 0, 0 },
		},
    },
# Aeon T2 Naval Perimeter Defense Template
    {
        {{'T2Artillery','T2AADefense'},
			{-3,-5 },
			{-3, 5 },
		},
		{{'T3AADefense'},
			{ 4,-5 },
			{ 4, 6 },
		},
		{{'T2GroundDefense','T2MissileDefense'},
			{-3, 0 },
			{ 4, 0 },
		},
		{{'T2NavalDefense'},
            { 0,-5 },
			{ 0, 5 },
		},
		{{'T3NavalDefense'},
			{ 0, 0 },
		},
    }, 
# Cybran T2 Naval Perimeter Defense Template
    {
        {{'T2Artillery','T2AADefense'},
			{-3,-5 },
			{-3, 5 },
		},
		{{'T3AADefense'},
			{ 4,-5 },
			{ 4, 6 },
		},
		{{'T2GroundDefense','T2MissileDefense'},
			{-3, 0 },
			{ 4, 0 },
		},
		{{'T2NavalDefense'},
            { 0,-5 },
			{ 0, 5 },
		},
		{{'T3NavalDefense'},
			{ 0, 0 },
		},
    },
# Seraphim T2 Naval Perimeter Defense Template
    {
        {{'T2Artillery','T2AADefense'},
			{-3,-5 },
			{-3, 5 },
		},
		{{'T3AADefense'},
			{ 4,-5 },
			{ 4, 6 },
		},
		{{'T2GroundDefense','T2MissileDefense'},
			{-3, 0 },
			{ 4, 0 },
		},
		{{'T2NavalDefense'},
            { 0,-5 },
			{ 0, 5 },
		},
		{{'T3NavalDefense'},
			{ 0, 0 },
		},
    },
}

PerimeterDefenseExpansionTemplates = {
# UEF Perimeter Defense Expansion
    {
        {
            {
            'T2ShieldDefense', 
			'T3ShieldDefense',
            },
            { 0, 0, 0 },
        },
        {
            {
            'T2AADefense', 
            },
            { 6, -6, 0 },
            { -6, 6, 0 },
        },
        {
            {
            'T3AADefense', 
            },
            { -6, -6, 0 },
            { 6, 6, 0 },
        },
        {
            {
            'T2GroundDefense', 
            },
            { 6, -2, 0 },
            { -6, 2, 0 },
        },
        {
            {
            'T3GroundDefense', 
            },
            { 6, 2, 0 },
            { -6, -2, 0 },
        },
        {
            {
            'T2StrategicMissile', 
            },
            { 0, -6, 0 },
        },
        {
            {
            'T2MissileDefense', 
            },
            { 0, 6, 0 },
        },
    },
# Aeon Perimeter Defense Expansion
    {
        {
            {
            'T2ShieldDefense', 
			'T3ShieldDefense',
            },
            { 0, 0, 0 },
        },
        {
            {
            'T2AADefense', 
            },
            { 6, -6, 0 },
            { -6, 6, 0 },
        },
        {
            {
            'T3AADefense', 
            },
            { -6, -6, 0 },
            { 6, 6, 0 },
        },
        {
            {
            'T2GroundDefense', 
            },
            { 6, -2, 0 },
            { -6, 2, 0 },
        },
        {
            {
            'T3GroundDefense', 
            },
            { 6, 2, 0 },
            { -6, -2, 0 },
        },
        {
            {
            'T2StrategicMissile', 
            },
            { 0, -6, 0 },
        },
        {
            {
            'T2MissileDefense', 
            },
            { 0, 6, 0 },
        },
    },
# Cybran Perimeter Defense Expansion
    {
        {
            {
            'T2ShieldDefense', 
			'T3ShieldDefense',
            },
            { 0, 0, 0 },
        },
        {
            {
            'T2AADefense', 
            },
            { 6, -6, 0 },
            { -6, 6, 0 },
        },
        {
            {
            'T3AADefense', 
            },
            { -6, -6, 0 },
            { 6, 6, 0 },
        },
        {
            {
            'T2GroundDefense', 
            },
            { 6, -2, 0 },
            { -6, 2, 0 },
        },
        {
            {
            'T3GroundDefense', 
            },
            { 6, 2, 0 },
            { -6, -2, 0 },
        },
        {
            {
            'T2StrategicMissile', 
            },
            { 0, -6, 0 },
        },
        {
            {
            'T2MissileDefense', 
            },
            { 0, 6, 0 },
        },
    },
# Seraphim Perimeter Defense Expansion
    {
        {
            {
            'T2ShieldDefense', 
			'T3ShieldDefense',
            },
            { 0, 0, 0 },
        },
        {
            {
            'T2AADefense', 
            },
            { 6, -6, 0 },
            { -6, 6, 0 },
        },
        {
            {
            'T3AADefense', 
            },
            { -6, -6, 0 },
            { 6, 6, 0 },
        },
        {
            {
            'T2GroundDefense', 
            },
            { 6, -2, 0 },
            { -6, 2, 0 },
        },
        {
            {
            'T3GroundDefense', 
            },
            { 6, 2, 0 },
            { -6, -2, 0 },
        },
        {
            {
            'T2StrategicMissile', 
            },
            { 0, -6, 0 },
        },
        {
            {
            'T2MissileDefense', 
            },
            { 0, 6, 0 },
        },
    },
}

