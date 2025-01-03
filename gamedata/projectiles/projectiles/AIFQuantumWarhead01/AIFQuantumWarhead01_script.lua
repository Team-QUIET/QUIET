local AQuantumWarheadProjectile = import('/lua/aeonprojectiles.lua').AQuantumWarheadProjectile

local ForkThread = ForkThread
local KillThread = KillThread
local WaitSeconds = WaitSeconds

AIFQuantumWarhead01 = ClassProjectile(AQuantumWarheadProjectile) {

    OnImpact = function(self, TargetType, TargetEntity)

        if not TargetEntity or not EntityCategoryContains(categories.PROJECTILE, TargetEntity) then

            local myBlueprint = self:GetBlueprint()

            if myBlueprint.Audio.Explosion then
                self:PlaySound(myBlueprint.Audio.Explosion)
            end

            nukeProjectile = self:CreateProjectile('/projectiles/AIFQuantumWarhead02/AIFQuantumWarhead02_proj.bp', 0, 0, 0, nil, nil, nil):SetCollision(false)
            nukeProjectile:PassDamageData(self.DamageData)
            nukeProjectile:PassData(self.Data)
        end

        AQuantumWarheadProjectile.OnImpact(self, TargetType, TargetEntity)
    end,

    DoTakeDamage = function(self, instigator, amount, vector, damageType)

        if self.ProjectileDamaged then
            for k,v in self.ProjectileDamaged do
                v(self)
            end
        end

        AQuantumWarheadProjectile.DoTakeDamage(self, instigator, amount, vector, damageType)
    end,

    OnCreate = function(self)

        AQuantumWarheadProjectile.OnCreate(self)

        local launcher = self:GetLauncher()

        if launcher and not launcher:IsDead() and launcher.EventCallbacks.ProjectileDamaged then

            self.ProjectileDamaged = {}

            for k,v in launcher.EventCallbacks.ProjectileDamaged do
                table.insert( self.ProjectileDamaged, v )
            end
        end

        self:SetCollisionShape('Sphere', 0, 0, 0, 5.0)

        self:ForkThread( self.MovementThread )
    end,

    MovementThread = function(self)

        local army = self:GetArmy()
        local launcher = self:GetLauncher()

        self:TrackTarget(false)

        WaitSeconds(2.5)

        self:SetCollision(true)

        WaitSeconds(5)

        self:TrackTarget(true)
        self:SetDestroyOnWater(true)        

        self:SetTurnRate(47.36)

        WaitSeconds(2)

        self:SetTurnRate(0)
        self:SetAcceleration(0.001)
        self.WaitTime = 0.5

        while not self:BeenDestroyed() do
            self:SetTurnRateByDist()
            WaitSeconds(self.WaitTime)
        end
    end,

    SetTurnRateByDist = function(self)

        local dist = self:GetDistanceToTarget()

        if dist > 150 then        
            self:SetTurnRate(0)

        elseif dist > 75 and dist <= 150 then
            self.WaitTime = 0.3

        elseif dist > 32 and dist <= 75 then
            self.WaitTime = 0.1

        elseif dist < 32 then
            self:SetTurnRate(50)
        end

    end,

    GetDistanceToTarget = function(self)
        local tpos = self:GetCurrentTargetPosition()
        local mpos = self:GetPosition()
        local dist = VDist2(mpos[1], mpos[3], tpos[1], tpos[3])
        return dist
    end,
}

TypeClass = AIFQuantumWarhead01
