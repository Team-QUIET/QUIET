local CLandUnit = import('/lua/defaultunits.lua').MobileUnit

local CAABurstCloudFlakArtilleryWeapon = import('/lua/cybranweapons.lua').CAABurstCloudFlakArtilleryWeapon

URL0205 = ClassUnit(CLandUnit) {
    DestructionPartsLowToss = {'Turret',},

    Weapons = {
        AAGun = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
    },
}

TypeClass = URL0205