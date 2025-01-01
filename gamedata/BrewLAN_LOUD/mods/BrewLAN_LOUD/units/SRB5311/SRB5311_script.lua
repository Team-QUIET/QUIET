local CWallStructureUnit = import('/lua/defaultunits.lua').WallStructureUnit

local CardinalWallUnit = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/walls.lua').CardinalWallUnit
local GateWallUnit = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/walls.lua').GateWallUnit
CWallStructureUnit = CardinalWallUnit( CWallStructureUnit ) 
CWallStructureUnit = GateWallUnit( CWallStructureUnit )

SRB5311 = ClassUnit(CWallStructureUnit) {}

TypeClass = SRB5311
