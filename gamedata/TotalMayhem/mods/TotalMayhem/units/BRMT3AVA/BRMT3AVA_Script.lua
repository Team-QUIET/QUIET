local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit

local WeaponsFile2 = import('/lua/terranweapons.lua')
local CWeapons = import('/lua/cybranweapons.lua')

local CIFCommanderDeathWeapon   = CWeapons.CIFCommanderDeathWeapon
local CDFParticleCannonWeapon   = CWeapons.CDFParticleCannonWeapon
local CDFProtonCannonWeapon     = CWeapons.CDFProtonCannonWeapon
local DualLaser                 = CWeapons.CDFHeavyMicrowaveLaserGeneratorCom
local MissileArray              = CWeapons.CIFMissileLoaWeapon
local CAAMissileNaniteWeapon    = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

local TDFGaussCannonWeapon  = WeaponsFile2.TDFLandGaussCannonWeapon

CWeapons = nil
WeaponsFile2 = nil

local EffectTemplate = import('/lua/EffectTemplates.lua')

BRMT3AVA = ClassUnit(CWalkingLandUnit) {
   
    Weapons = {
        
        TopTurret1      = ClassWeapon(CDFProtonCannonWeapon) {FxMuzzleFlashScale = 0.5,FxMuzzleFlash = EffectTemplate.CArtilleryFlash01},
        TopTurret2      = ClassWeapon(CDFProtonCannonWeapon) {FxMuzzleFlashScale = 0.5,FxMuzzleFlash = EffectTemplate.CArtilleryFlash01},
        NoseTurret      = ClassWeapon(CDFProtonCannonWeapon) {FxMuzzleFlashScale = 2.1,FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01},
        NoseRockets     = ClassWeapon(TDFGaussCannonWeapon) {FxMuzzleFlashScale = 0},        
        BG1             = ClassWeapon(DualLaser) {},
        BG2             = ClassWeapon(DualLaser) {},
        BG3             = ClassWeapon(DualLaser) {},
        BG4             = ClassWeapon(DualLaser) {},
        
        Missiles        = ClassWeapon(MissileArray) {FxMuzzleFlashScale = 0},
        AAMissiles       = ClassWeapon(CAAMissileNaniteWeapon) {},

        robottalk       = ClassWeapon(TDFGaussCannonWeapon) {FxMuzzleFlashScale = 0},
        DeathWeapon     = ClassWeapon(CIFCommanderDeathWeapon) {},
    },


OnStopBeingBuilt = function(self,builder,layer)

        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
      
        if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
            self:SetWeaponEnabledByLabel('robottalk', false)
        else
            self:SetWeaponEnabledByLabel('robottalk', true)
        end
        
    end,

}

TypeClass = BRMT3AVA