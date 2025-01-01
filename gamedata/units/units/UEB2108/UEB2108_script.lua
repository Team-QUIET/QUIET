local TStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local TIFCruiseMissileLauncher = import('/lua/terranweapons.lua').TIFCruiseMissileLauncher
local TIFCruiseMissileLaunchBuilding = import('/lua/EffectTemplates.lua').TIFCruiseMissileLaunchBuilding

UEB2108 = ClassUnit(TStructureUnit) {
    Weapons = {
        CruiseMissile = ClassWeapon(TIFCruiseMissileLauncher) { FxMuzzleFlash = TIFCruiseMissileLaunchBuilding },
    },
}
TypeClass = UEB2108