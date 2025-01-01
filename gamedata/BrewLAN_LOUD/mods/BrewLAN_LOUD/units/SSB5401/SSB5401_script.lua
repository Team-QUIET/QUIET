--------------------------------------------------------------------------------
-- Summary  :  Stargate Script
--------------------------------------------------------------------------------    
local SQuantumGateUnit = import('/lua/seraphimunits.lua').SQuantumGateUnit
local StargateDialing = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/lua/StargateDialing.lua').StargateDialing
SQuantumGateUnit = StargateDialing(SQuantumGateUnit) 

SSB5401 = ClassUnit(SQuantumGateUnit) {

}

TypeClass = SSB5401
