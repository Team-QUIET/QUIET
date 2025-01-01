local CLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAANanoDartWeapon = CybranWeaponsFile.CAANanoDartWeapon

WRL0309 = ClassUnit(CLandUnit) {
    Weapons = {
        MainGun = ClassWeapon(CAANanoDartWeapon) {},
    },
}

TypeClass = WRL0309