local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TAMPhalanxWeapon = import('/lua/terranweapons.lua').TAMPhalanxWeapon

UEB4201 = ClassUnit(TStructureUnit) {

    Weapons = {

        Turret01 = ClassWeapon(TAMPhalanxWeapon) {
        
                OnCreate = function(self)

                    self.SpinManip = CreateRotator(self.unit, 'Turret_Barrel_B01', 'z', nil, 0, 270, 0)
                    self.unit.Trash:Add(self.SpinManip)                

                    TAMPhalanxWeapon.OnCreate(self)
                end,

                PlayFxWeaponUnpackSequence = function(self)

                    self.SpinManip:SetTargetSpeed(270)

                    TAMPhalanxWeapon.PlayFxWeaponUnpackSequence(self)
                end,

                PlayFxWeaponPackSequence = function(self)

                    self.SpinManip:SetTargetSpeed(0)

                    TAMPhalanxWeapon.PlayFxWeaponPackSequence(self)
                end,
            
            },
    },
}

TypeClass = UEB4201