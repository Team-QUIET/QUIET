local AConstructionUnit = import(import( '/lua/game.lua' ).BrewLANLOUDPath() .. '/units/sal0319/sal0319_script.lua').SAL0319

SAL0209 = ClassUnit(AConstructionUnit) { 
    OnCreate = function( self ) 
        AConstructionUnit.OnCreate(self)
        self:HideBone('Tube003', true)
    end,
}

TypeClass = SAL0209

