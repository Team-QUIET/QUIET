local ALandUnit = import('/lua/defaultunits.lua').MobileUnit

local ADFDisruptorCannonWeapon = import('/lua/aeonweapons.lua').ADFDisruptorWeapon

DAL0310 = ClassUnit(ALandUnit) {
    Weapons = {
        MainGun = ClassWeapon(ADFDisruptorCannonWeapon) {
            CreateProjectileAtMuzzle = function(self, muzzle)
                local proj = ADFDisruptorCannonWeapon.CreateProjectileAtMuzzle(self, muzzle)
                local data = self:GetBlueprint().DamageToShields
                if proj and not proj:BeenDestroyed() then
                    proj:PassData(data)
                end
            end,
          }
    },
}
TypeClass = DAL0310

