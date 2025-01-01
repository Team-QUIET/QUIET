local TLandUnit = import('/lua/defaultunits.lua').MobileUnit

local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon

BEL0211 = ClassUnit(TLandUnit) {
    Weapons = {
        Flamer = ClassWeapon(TDFMachineGunWeapon) {},
    },
}

TypeClass = BEL0211