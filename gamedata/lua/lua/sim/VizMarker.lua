---  /lua/defaultvizmarkers.lua
---  Summary  :  Visibility Entities

local Entity = import('/lua/sim/Entity.lua').Entity

local WaitTicks = coroutine.yield

local VectorCached = { 0, 0, 0 }
local Warp = Warp

VizMarker = Class(Entity) {

    __init = function(self, spec)
        Entity.__init(self, spec)
        self.X = spec.X
        self.Z = spec.Z
        self.LifeTime = spec.LifeTime
        self.Radius = spec.Radius
        self.Army = spec.Army
        self.Omni = spec.Omni
        self.Radar = spec.Radar
        self.Vision = spec.Vision
        self.WaterVision = spec.WaterVision
    end,

    OnCreate = function(self)
	
        Entity.OnCreate(self)
        
        local vec = VectorCached
        
        vec[1] = self.X
        vec[2] = 0
        vec[3] = self.Z

        Warp( self, vec )
		
        if self.Omni != false then
            self:InitIntel(self.Army, 'Omni', self.Radius)
            self:EnableIntel('Omni')
        end
        if self.Radar != false then
            self:InitIntel(self.Army, 'Radar', self.Radius)
            self:EnableIntel('Radar')
        end        
        if self.Vision != false then
            self:InitIntel(self.Army, 'Vision', self.Radius)
            self:EnableIntel('Vision')
        end
        if self.WaterVision != false then
            self:InitIntel(self.Army, 'WaterVision', self.Radius)
            self:EnableIntel('WaterVision')
        end
        if self.LifeTime > 0 then
            self.LifeTimeThread = ForkThread(self.VisibleLifeTimeThread, self)
        end
    end,

    VisibleLifeTimeThread = function(self)
        WaitTicks(self.LifeTime * 10)
        self:Destroy()
    end,

    OnDestroy = function(self)
        Entity.OnDestroy(self)
        if self.LifeTimeThread then
            self.LifeTimeThread:Destroy()
        end
    end
}
local PositionCache = { 0, 0, 0 }

--- Performance-wise a better alternative to the regular vision marker. 
--- Credits to Forged Alliance Forever
--- Note for future replace all unit script VizMarkers with this (Azraeel)
---@class VisionMarkerOpti : Entity
VisionMarkerOpti = Class(Entity) {

    --- Update all intel types
    ---@see `UpdateIntel` if you intend to apply only one intel type
    ---@see `UpdatePosition`and `UpdateDuration` for additional functionality
    ---@param self VisionMarkerOpti
    ---@param lifetime number       # Duration of the intel, if set to -1 it lasts indefinitely
    ---@param army number           # Army that we're creating intel for
    ---@param radius number         # Radius of the intel type(s)
    ---@param vision? boolean       # Intel type is enabled when true, disabled when false and left alone when nil
    ---@param waterVision? boolean  # Intel type is enabled when true, disabled when false and left alone when nil
    ---@param radar? boolean        # Intel type is enabled when true, disabled when false and left alone when nil
    ---@param sonar? boolean        # Intel type is enabled when true, disabled when false and left alone when nil
    ---@param omni? boolean         # Intel type is enabled when true, disabled when false and left alone when nil
    UpdateAllIntel = function(self, army, lifetime, radius, vision, waterVision, radar, sonar, omni)
        if vision then
            self:InitIntel(army, 'Vision', radius)
            self:EnableIntel('Vision')
        elseif vision == false then
            self:DisableIntel('Vision')
        end

        if waterVision then
            self:InitIntel(army, 'WaterVision', radius)
            self:EnableIntel('WaterVision')
        elseif waterVision == false then 
            self:DisableIntel('WaterVision')
        end

        if radar then
            self:InitIntel(army, 'Radar', radius)
            self:EnableIntel('Radar')
        elseif radar == false then 
            self:DisableIntel('Radar')
        end

        if sonar then
            self:InitIntel(army, 'Sonar', radius)
            self:EnableIntel('Sonar')
        elseif sonar == false then 
            self:DisableIntel('Sonar')
        end

        if omni then
            self:InitIntel(army, 'Omni', radius)
            self:EnableIntel('Omni')
        elseif omni == false then 
            self:DisableIntel('Omni')
        end
    end,

    --- Updates the position of where the intel is shown
    ---@param self VisionMarkerOpti
    ---@param x number
    ---@param z number
    UpdatePosition = function(self, x, z)
        PositionCache[1] = x
        PositionCache[3] = z
        PositionCache[2] = GetTerrainHeight(x, z)
        Warp(self, PositionCache)
    end,

    --- Update one specific intel type
    ---@param self VisionMarkerOpti
    ---@param army number
    ---@param radius number
    ---@param type IntelType
    ---@param enable boolean Intel type is enabled when true and disabled otherwise
    UpdateIntel = function(self, army, radius, type, enable)
        if enable then
            self:InitIntel(army, type, radius)
            self:EnableIntel(type)
        else
            self:DisableIntel(type)
        end
    end,

    --- Update the duration of this intel entity
    ---@param self VisionMarkerOpti
    ---@param duration number
    UpdateDuration = function(self, duration)
        -- allow for extending the duration
        if self.Thread then
            KillThread(self.Thread)
        end

        self.Thread = ForkThread(self.LifetimeThread, self, duration)
    end,

    --- Life time thread when the duration is set
    ---@param self VisionMarkerOpti
    ---@param duration number
    LifetimeThread = function(self, duration)
        WaitTicks(10 * duration + 1)
        self:Destroy()
    end,
}