local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local WeaponsFile = import('/lua/terranweapons.lua')

local TDFHiroPlasmaCannon = WeaponsFile.TDFHiroPlasmaCannon

WEL0207 = ClassUnit(TLandUnit) {
    Weapons = {
        TMD = ClassWeapon(TDFHiroPlasmaCannon) {},
    },
}
TypeClass = WEL0207