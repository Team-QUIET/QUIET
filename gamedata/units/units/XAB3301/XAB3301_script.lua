local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local RemoteViewing = import('/lua/RemoteViewing.lua').RemoteViewing

AStructureUnit = RemoteViewing( AStructureUnit )

XAB3301 = ClassUnit(AStructureUnit) {}

TypeClass = XAB3301