local SLosaareAAAutoCannon = import('/lua/seraphimprojectiles.lua').SLosaareAAAutoCannon

SAALosaareAutoCannon02 = ClassProjectile(SLosaareAAAutoCannon) {

    OnImpact = function(self, TargetType, TargetEntity)
        SLosaareAAAutoCannon.OnImpact(self, TargetType, TargetEntity)
    end,

}
TypeClass = SAALosaareAutoCannon02
