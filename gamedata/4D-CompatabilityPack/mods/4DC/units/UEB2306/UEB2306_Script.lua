local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local TDFIonizedPlasmaCannon = import('/lua/terranweapons.lua').TDFIonizedPlasmaCannon

UEB2306 = ClassUnit(TStructureUnit) {
    Weapons = {
        Gauss01 = ClassWeapon(TDFIonizedPlasmaCannon) {},    
    },
}

TypeClass = UEB2306