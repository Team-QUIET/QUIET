CAANanoDartProjectile = import('/lua/cybranprojectiles.lua').CAANanoDartProjectile03

CAANanoDart02 = ClassProjectile(CAANanoDartProjectile) {

   OnCreate = function(self)
        CAANanoDartProjectile.OnCreate(self)
        for k, v in self.FxTrails do
            CreateEmitterOnEntity(self,self:GetArmy(),v )
        end
   end,
}

TypeClass = CAANanoDart02
