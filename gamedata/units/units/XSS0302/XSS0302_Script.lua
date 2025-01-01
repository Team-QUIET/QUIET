local SSeaUnit =  import('/lua/defaultunits.lua').SeaUnit

local SeraphimWeapons = import('/lua/seraphimweapons.lua')

local SDFHeavyQuarnonCannon     = SeraphimWeapons.SDFHeavyQuarnonCannon
local SAMElectrumMissileDefense = SeraphimWeapons.SAMElectrumMissileDefense
local SAAOlarisCannonWeapon     = SeraphimWeapons.SAAOlarisCannonWeapon
local SIFInainoWeapon           = SeraphimWeapons.SIFInainoWeapon

SeraphimWeapons = nil

XSS0302 = ClassUnit(SSeaUnit) {

    FxDamageScale = 1.6,
    DestructionTicks = 250,

    Weapons = {
	
        Turret = ClassWeapon(SDFHeavyQuarnonCannon) {},
		
        AntiMissile = ClassWeapon(SAMElectrumMissileDefense) {},
		
        AntiAir = ClassWeapon(SAAOlarisCannonWeapon) {},
		
        InainoMissiles = ClassWeapon(SIFInainoWeapon) {},
		
    },
	
	OnCreate = function(self)

        SSeaUnit.OnCreate(self)

        if type(ScenarioInfo.Options.RestrictedCategories) == 'table' and table.find(ScenarioInfo.Options.RestrictedCategories, 'NUKE') then
            self:SetWeaponEnabledByLabel('InainoMissiles', false)
        end
    end,
}

TypeClass = XSS0302