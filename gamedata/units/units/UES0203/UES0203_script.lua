local TSubUnit =  import('/lua/defaultunits.lua').SubUnit

local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler
local TDFLightPlasmaCannonWeapon = import('/lua/terranweapons.lua').TDFLightPlasmaCannonWeapon

UES0203 = ClassUnit(TSubUnit) {

    Weapons = {
        Torpedo = ClassWeapon(TANTorpedoAngler) {},
        PlasmaGun = ClassWeapon(TDFLightPlasmaCannonWeapon) {}
    },
	
}


TypeClass = UES0203