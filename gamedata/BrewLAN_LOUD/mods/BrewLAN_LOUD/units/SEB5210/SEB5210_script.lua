local TWallStructureUnit = import('/lua/defaultunits.lua').WallStructureUnit

local CardinalWallUnit = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/walls.lua').CardinalWallUnit

TWallStructureUnit = CardinalWallUnit( TWallStructureUnit )

SEB5210 = ClassUnit(TWallStructureUnit) {}

TypeClass = SEB5210
