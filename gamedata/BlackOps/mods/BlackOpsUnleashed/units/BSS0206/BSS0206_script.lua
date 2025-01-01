local SSeaUnit = import('/lua/defaultunits.lua').SeaUnit

local SIFSuthanusArtilleryCannon    = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon
local SAAOlarisCannonWeapon         = import('/lua/seraphimweapons.lua').SAAOlarisCannonWeapon

BSS0206 = ClassUnit(SSeaUnit) {

    Weapons = {
        DeckGun = ClassWeapon(SIFSuthanusArtilleryCannon) {},
		AAGun = ClassWeapon(SAAOlarisCannonWeapon) {},

    },

}

TypeClass = BSS0206