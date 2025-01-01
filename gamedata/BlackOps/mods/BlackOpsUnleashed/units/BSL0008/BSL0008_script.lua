local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SeraphimWeapons = import('/lua/seraphimweapons.lua')

local SDFSihEnergyRifleNormalMode = SeraphimWeapons.SDFSniperShotNormalMode
local SDFSihEnergyRifleSniperMode = SeraphimWeapons.SDFSniperShotSniperMode

BSL0008 = ClassUnit(SLandUnit) {

    Weapons = {
        MainGun = ClassWeapon(SDFSihEnergyRifleNormalMode) {},
		
        SniperGun = ClassWeapon(SDFSihEnergyRifleSniperMode) {
		
            SetOnTransport = function(self, transportstate)
			
                SDFSihEnergyRifleSniperMode.SetOnTransport(self, transportstate)
                self.unit:SetScriptBit('RULEUTC_WeaponToggle', false)
				
            end,
        },
    },

    OnCreate = function(self)
	
        SLandUnit.OnCreate(self)
		
		self:SetVeterancy(5)
		
        self:SetWeaponEnabledByLabel('SniperGun', false)
    end,

    OnScriptBitSet = function(self, bit)
	
        SLandUnit.OnScriptBitSet(self, bit)
		
        if bit == 1 then 
		
            local landspeed = self:GetBlueprint().Physics.LandSpeedMultiplier or 1
			
            self:SetSpeedMult( landspeed * 0.6 )

            self:SetWeaponEnabledByLabel('SniperGun', true)
            self:SetWeaponEnabledByLabel('MainGun', false)
			
            self:GetWeaponManipulatorByLabel('SniperGun'):SetHeadingPitch( self:GetWeaponManipulatorByLabel('MainGun'):GetHeadingPitch() )
        end
    end,

    OnScriptBitClear = function(self, bit)
	
        SLandUnit.OnScriptBitClear(self, bit)
		
        if bit == 1 then 
		
            -- Reset movement speed
            local landspeed = self:GetBlueprint().Physics.LandSpeedMultiplier or 1
			
            self:SetSpeedMult( landspeed )
            
            self:SetWeaponEnabledByLabel('SniperGun', false)
            self:SetWeaponEnabledByLabel('MainGun', true)
			
            self:GetWeaponManipulatorByLabel('MainGun'):SetHeadingPitch( self:GetWeaponManipulatorByLabel('SniperGun'):GetHeadingPitch() )
        end
    end,
}

TypeClass = BSL0008