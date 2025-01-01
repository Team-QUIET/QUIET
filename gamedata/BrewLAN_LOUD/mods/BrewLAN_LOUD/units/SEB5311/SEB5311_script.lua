local TWallStructureUnit = import('/lua/defaultunits.lua').WallStructureUnit

local CardinalWallUnit = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/walls.lua').CardinalWallUnit

local GateWallUnit = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/walls.lua').GateWallUnit

TWallStructureUnit = CardinalWallUnit( TWallStructureUnit ) 
TWallStructureUnit = GateWallUnit( TWallStructureUnit )

SEB5311 = ClassUnit(TWallStructureUnit) {}

TypeClass = SEB5311
