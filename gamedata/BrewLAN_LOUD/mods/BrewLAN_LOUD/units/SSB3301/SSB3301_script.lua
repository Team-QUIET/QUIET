local SStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local RemoteViewing = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/RemoteViewing.lua').RemoteViewing

SStructureUnit = RemoteViewing( SStructureUnit )

SSB3301 = ClassUnit(SStructureUnit) {}

TypeClass = SSB3301
