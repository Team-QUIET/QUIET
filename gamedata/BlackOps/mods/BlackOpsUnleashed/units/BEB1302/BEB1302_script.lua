local TEnergyCreationUnit = import('/lua/defaultunits.lua').EnergyCreationUnit

BEB1302 = ClassUnit(TEnergyCreationUnit) {

    DestructionPartsHighToss = {'Exhaust01',},
    DestructionPartsLowToss = {'Exhaust01','Exhaust02','Exhaust03','Exhaust04','Exhaust05',},
    DestructionPartsChassisToss = {'BEB1302'},

    OnStopBeingBuilt = function(self,builder,layer)
	
        TEnergyCreationUnit.OnStopBeingBuilt(self,builder,layer)

        self.EffectsBag = {}
        self.AnimManip = CreateAnimator(self)
        self.Trash:Add(self.AnimManip)
        ChangeState(self, self.ActiveState)
    end,

    ActiveState = State {
	
        Main = function(self)

            local myBlueprint = __blueprints[self.BlueprintID]

            self.AnimManip:PlayAnim(myBlueprint.Display.AnimationOpen, false):SetRate(1)

            WaitFor(self.AnimManip)

            local effects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp'}
            local bones = {'Exhaust01','Exhaust06','Exhaust07','Exhaust08','Exhaust09'}
            local scale = 1
			
            if self.CacheLayer == 'Seabed' then
                effects = {'/effects/emitters/underwater_idle_bubbles_01_emit.bp'}
                scale = 3
            end
			
			local CreateAttachedEmitter = CreateAttachedEmitter

            for keys,values in effects do
                for keysbones,valuesbones in bones do
                    table.insert(self.EffectsBag, CreateAttachedEmitter(self,valuesbones,self:GetArmy(), values):ScaleEmitter(scale):OffsetEmitter(0,-.1,0))
                end
            end
        end,
    },
}

TypeClass = BEB1302