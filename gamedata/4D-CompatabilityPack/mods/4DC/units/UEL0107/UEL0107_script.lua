local THoverLandUnit = import('/lua/defaultunits.lua').MobileUnit

local MortarWeapon               = import('/lua/terranweapons.lua').TDFFragmentationGrenadeLauncherWeapon
local AANDepthChargeBombWeapon      = import('/lua/aeonweapons.lua').AANDepthChargeBombWeapon

UEL0107 = ClassUnit(THoverLandUnit) {

    Weapons = {
        Mortar = ClassWeapon(MortarWeapon){},
        DepthCharge = ClassWeapon(AANDepthChargeBombWeapon){},
    },

}
TypeClass = UEL0107