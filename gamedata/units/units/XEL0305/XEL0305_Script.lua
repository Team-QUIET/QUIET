local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local TDFIonizedPlasmaCannon = import('/lua/terranweapons.lua').TDFIonizedPlasmaCannon

XEL0305 = ClassUnit(TWalkingLandUnit) {

    Weapons = {
        PlasmaCannon01 = ClassWeapon(TDFIonizedPlasmaCannon) {},
    },

}

TypeClass = XEL0305