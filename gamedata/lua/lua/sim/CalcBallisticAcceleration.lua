--**  File     :  /lua/sim/CalcBallisticAcceleration.lua
--**  Author(s):  Kaskouy, Brute51
--**
--**  Summary  :  Calculates bomb drop ballistic acceleration values

-- This script was done by Kaskouy and is based on my 'static' first bomb
-- bug fix. Kaskouy's code is more flexible and should work in (almost) any 
-- case wheras mine only does when the bomber flies at default height at 
-- default speed. The script below takes all that into account (speed, 
-- height, etc) and calculates the proper value to feed to the bomb adjust 
-- function. [152]

-- upvalue globals for performance
local GetSurfaceHeight = GetSurfaceHeight
local VDist2 = VDist2

local EntityMethods = moho.entity_methods
local EntityGetPosition = EntityMethods.GetPosition
local EntityGetPositionXYZ = EntityMethods.GetPositionXYZ

local UnitMethods = moho.unit_methods
local UnitGetVelocity = UnitMethods.GetVelocity
local UnitGetTargetEntity = UnitMethods.GetTargetEntity

CalculateBallisticAcceleration = function(self, projectile)
	local launcher = projectile:GetLauncher()
	if not launcher then -- fail-fast
		return 4.9 -- Return the default gravity value if some calculations fail
	end

	local UnitGetVelocity = UnitGetVelocity
	local VDist2 = VDist2
	-- Get projectile position and velocity
	-- velocity will need to be multiplied by 10 due to being returned /tick instead of /s
	local projPosX, projPosY, projPosZ = EntityGetPositionXYZ(projectile)
	local projVelX, _, projVelZ = UnitGetVelocity(launcher)

	local targetPos
	local targetVelX, targetVelZ = 0, 0

	local data = self.CurrentSalvoData

	-- if it's the first time...
	if not data then
		-- setup target (which won't change mid-bombing run)
		local target = UnitGetTargetEntity(launcher)
		if target then -- target is a unit / prop
			targetPos = EntityGetPosition(target)
			if not target.IsProp then
				targetVelX, _, targetVelZ = UnitGetVelocity(target)
			end
		else -- target is a position i.e. attack ground
			targetPos = self:GetCurrentTargetPos()
		end

		-- and there's not going to be a second time
		if self.bp.MuzzleSalvoSize <= 1 then
			-- do the calculation but skip any cache or salvo logic
			if not targetPos then
				return 4.9
			end
			if target and not target.IsProp then
				targetVelX, _, targetVelZ = UnitGetVelocity(target)
			end
			local targetPosX, targetPosZ = targetPos[1], targetPos[3]
			local distVel = VDist2(projVelX, projVelZ, targetVelX, targetVelZ)
			if distVel == 0 then
				return 4.9
			end
			local distPos = VDist2(projPosX, projPosZ, targetPosX, targetPosZ)
			do
				local dropShort = self.DropBombShortRatio
				if dropShort then
					distPos = distPos * dropShort
				end
			end
			if distPos == 0 then
				return 4.9
			end
			local time = distPos / distVel
			projPosY = projPosY - GetSurfaceHeight(targetPosX + time * targetVelX, targetPosZ + time * targetVelZ)
			return 200 * projPosY / (time * time)
		else -- otherwise, calculate & cache a couple things the first time only
			data = {
				lastAccel = 4.9,
				targetPos = targetPos,
			}
			if target then
				if target.Dead then
					data.target = nil
				else
					data.target = target
				end
			end
			self.CurrentSalvoData = data
		end
	else -- if it's a successive bomb drop, update the targeting data
		local target = data.target
		if target then
			if target.Dead then -- if the unit is destroyed, use the last known position
				data.target = nil
				targetPos = data.targetPos
			else
				if not target.IsProp then
					targetVelX, _, targetVelZ = UnitGetVelocity(target)
				end
				targetPos = EntityGetPosition(target)
			end
		else
			targetPos = data.targetPos
		end
	end
	if not targetPos then
		-- put the bomb cluster in free-fall
		local GetSurfaceHeight = GetSurfaceHeight
		local MathSqrt = math.sqrt
		local spread = self.AdjustedSalvoDelay * (self.SalvoSpreadStart + self.CurrentSalvoNumber)
		-- default gravitational acceleration is 4.9; however, bomb clusters adjust the time it takes to land
		-- so we convert the acceleration to time to add the spread and convert back:
		-- h = unitY - surfaceY         =>  h2 = 0.5 * (unitY - surfaceHeight(unitX, unitZ))
		-- t = sqrt(2 h / a) + spread   =>  t = sqrt(4 / 4.9 * h2) + spread
		-- a = 0.5 h / t^2              =>  a = h2 / t^2
		local halfHeight = 0.5 * (projPosY - GetSurfaceHeight(projPosX, projPosZ))
		if halfHeight < 0.01 then return 4.9 end
		local time = MathSqrt(0.816326530612 * halfHeight) + spread

		-- now that we know roughly when we'll land, we can find a better guess for where
		-- we'll land, and thus guess the true falling height better as well
		halfHeight = 0.5 * (projPosY - GetSurfaceHeight(projPosX + time * projVelX, projPosX + time * projVelX))
		if halfHeight < 0.01 then return 4.9 end
		time = MathSqrt(0.816326530612 * halfHeight) + spread

		local acc = halfHeight / (time * time)
		data.lastAccel = acc
		return acc
	end

	-- calculate flat (exclude y-axis) distance and velocity between projectile and target
	-- velocity will eventually need to multiplied by 10 due to being per tick instead of per second
	local distVel = VDist2(projVelX, projVelZ, targetVelX, targetVelZ)
	if distVel == 0 then
		data.lastAccel = 4.9
		return 4.9
	end
	local targetPosX, targetPosZ = targetPos[1], targetPos[3]

	-- calculate the distance for this particular bomb
	local distPos = VDist2(projPosX, projPosZ, targetPosX, targetPosZ)
	do
		local dropShort = self.DropBombShortRatio
		if dropShort then
			distPos = distPos * dropShort
		end
	end

	-- how many ticks until the bomb hits the target in xz-space
	local time = distPos / distVel
	local adjustedTime = time + self.AdjustedSalvoDelay * (self.SalvoSpreadStart + self.CurrentSalvoNumber)
	if adjustedTime == 0 then
		data.lastAccel = 4.9
		return 4.9
	end

	-- If we have a target, targetPos may have updated now.
	-- save the new predicted target position in case we lose the target
	-- so that we can drop the bomb salvo centered onto there.
	if data.target then
		targetPos[1] = targetPos[1] + time * targetVelX
		targetPos[3] = targetPos[3] + time * targetVelZ
		data.targetPos = targetPos
	end

	-- find out where the target will be at that point in time (it could be moving)
	-- (time and velocity being in ticks cancel out)
	-- what is the height difference at that future position
	projPosY = projPosY -
		GetSurfaceHeight(targetPosX + adjustedTime * targetVelX, targetPosZ + adjustedTime * targetVelZ)

	-- The basic formula for displacement over time is h = 0.5 * a * t^2
	-- h: displacement, a: acceleration, t: time
	-- now we can calculate what acceleration we need to make it hit the target in the y-axis
	-- a = 2 * h / t^2

	-- also convert time from ticks to seconds (multiply by 10, twice)
	local acc = 200 * projPosY / (adjustedTime * adjustedTime)

	data.lastAccel = acc
	return acc
end
