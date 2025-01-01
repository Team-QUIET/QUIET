local SLandUnit = import('/lua/defaultunits.lua').MobileUnit

local SDFUnstablePhasonBeam = import('/lua/kirvesweapons.lua').SDFUnstablePhasonBeam

local Dummy = import('/lua/kirvesweapons.lua').Dummy

local EffectTemplate = import('/lua/kirveseffects.lua')

local CreateAttachedEmitter = CreateAttachedEmitter

BSLK004 = ClassUnit(SLandUnit) {

    Weapons = {
        PhasonBeam = ClassWeapon(SDFUnstablePhasonBeam) {
			FxMuzzleFlash = {'/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_01_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_02_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_03_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_04_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_05_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_06_emit.bp','/mods/BlackOpsUnleashed/Effects/Emitters/seraphim_electricity_emit.bp'},
		},
		
		Dummy = ClassWeapon(Dummy) {},
    },
	
	AmbientEffects = 'OrbGlowEffect',
	
	OnStopBeingBuilt = function(self,builder,layer)
	
		SLandUnit.OnStopBeingBuilt(self,builder,layer)
		
        local army =  self.Army
		
        if self.AmbientEffects then
            for k, v in EffectTemplate[self.AmbientEffects] do
				CreateAttachedEmitter(self, 'Orb', army, v)
            end
        end
    end,
}
TypeClass = BSLK004