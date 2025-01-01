local SSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local SWeapon = import('/lua/seraphimweapons.lua')

XSS0103 = ClassUnit(SSeaUnit) {

    Weapons = {
        MainGun = ClassWeapon(SWeapon.SDFShriekerCannon){},
        AntiAir = ClassWeapon(SWeapon.SAAShleoCannonWeapon){},
    },
}

TypeClass = XSS0103
