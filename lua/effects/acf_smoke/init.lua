--[[---------------------------------------------------------
Initializes the effect. The data is a table of data
which was passed from the server.
-----------------------------------------------------------]]

function EFFECT:Init( data )
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Colour = data:GetStart()
	self.Radius = math.min(math.log(1 + data:GetRadius()) / 0.02303,350) --smoke filler (long lasting, slow deploy)
	self.Magnitude = math.min(math.log(1 + data:GetMagnitude()) / 0.02303,350) --WP filler (fast deploy, short duration)
	--print(self.Radius .. " " .. self.Magnitude)
	self.Emitter = ParticleEmitter( self.Origin )

	local ImpactTr = { }
		ImpactTr.start = self.Origin - self.DirVec * 20
		ImpactTr.endpos = self.Origin + self.DirVec * 20
		ImpactTr.mins = Vector(0,0,0)
		ImpactTr.maxs = Vector(0,0,0)
	local Impact = util.TraceHull(ImpactTr)										--Trace to see if it will hit anything
	self.Normal = Impact.HitNormal

	local GroundTr = { }
		GroundTr.start = self.Origin + Vector(0,0,1)
		GroundTr.endpos = self.Origin - Vector(0,0,1) * self.Radius
		GroundTr.mask = 131083
		GroundTr.mins = Vector(0,0,0)
		GroundTr.maxs = Vector(0,0,0)
	local Ground = util.TraceHull(GroundTr)

	local SmokeColor = self.Colour or Vector(255,255,255)
	if not Ground.HitWorld then Ground.HitNormal = Vector(0,0,1) end

	--if adjusting, update display data / crate text in smoke round
	if self.Magnitude > 0 then
		self:SmokeFiller( Ground, SmokeColor, self.Magnitude * 1.25, 1.0, 6 + self.Magnitude / 10 ) --quick build and dissipate
	end

	if self.Radius > 0 then
		self:SmokeFiller( Ground, SmokeColor, self.Radius * 1.25, 0.15, 20 + self.Radius / 4 ) --slow build but long lasting
	end

	self.Emitter:Finish()
end

local smokes = {
	"particle/smokesprites_0001",
	"particle/smokesprites_0002",
	"particle/smokesprites_0003",
	"particle/smokesprites_0004",
	"particle/smokesprites_0005",
	"particle/smokesprites_0006",
	"particle/smokesprites_0008"
}

local lastWindUpdateTime = 0
local windDirection = Vector(0, 0, 0)  -- Initialize with a default wind direction

local lastWindUpdateTime = 0
local windStrength = 0  -- Initialize windStrength to 0
local curveFactor = 3 -- How biased the wind strength to 0 is (curvature!!)

local function smokePuff(self, Ground, ShootVector, Radius, RadiusMod, Density, i, SmokeColor, DeploySpeed, Lifetime)
	local currentTime = CurTime()

	-- Check if it's time to update the wind direction and windStrength
	local timer = 60 -- Update wind direction every n seconds (adjust the time interval as needed) 
	if currentTime - lastWindUpdateTime > timer then
		lastWindUpdateTime = currentTime

		-- Generate a new random wind direction
		windDirection = Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0):GetNormalized()

		if ACF.SmokeWind ~= 0 then
			local randValue = math.Rand(0, 1)
			windStrength = (randValue ^ curveFactor) * ACF.SmokeWind
		else
			windStrength = 0
		end
	end

	local Smoke = self.Emitter:Add(smokes[math.random(1, #smokes)], Ground.HitPos)
	if Smoke then
		-- Calculate the wind effect on velocity and gravity
		local velocity = (ShootVector + Vector(0, 0, 0.2)) * (Radius * RadiusMod) * DeploySpeed
		local gravity = Vector(0, 0, math.Rand(5, 15))

		-- Apply wind effect based on wind direction and windStrength
		local windEffect = windDirection * (windStrength * math.Rand(0.5, 1.5))
		velocity = velocity + windEffect * (i / Density)
		gravity = gravity + windEffect * 0.2

		Smoke:SetVelocity(velocity)
		Smoke:SetLifeTime(0)
		Smoke:SetDieTime(math.Clamp(Lifetime, 1, 60))
		Smoke:SetStartAlpha(math.Rand(200, 255))
		Smoke:SetEndAlpha(0)
		Smoke:SetStartSize(math.Clamp((Radius * RadiusMod) * DeploySpeed, 5, 1000))
		Smoke:SetEndSize(math.Clamp(Radius * RadiusMod * 4, 150, 4000))
		Smoke:SetRoll(math.Rand(0, 360))
		Smoke:SetRollDelta(math.Rand(-0.2, 0.2))
		Smoke:SetAirResistance(100 * DeploySpeed)
		Smoke:SetGravity(gravity)
		Smoke:SetColor(SmokeColor.x, SmokeColor.y, SmokeColor.z)
	end
end









function EFFECT:SmokeFiller( Ground, SmokeColor, Radius, DeploySpeed, Lifetime )

	local Density = Radius / 18
	local Angle = Ground.HitNormal:Angle()
	local ShootVector = Ground.HitNormal * 0.5
	--print(Radius .. ", " .. Density)

	smokePuff(self, Ground, Vector(0, 0, 0.3), Radius, 1.5, Density, 0, SmokeColor, DeploySpeed, Lifetime) --smoke filler initial upward puff
	for i = 0, math.floor(Density) do
		smokePuff(self, Ground, ShootVector, Radius, 1, Density, i, SmokeColor, DeploySpeed, Lifetime)

		ShootVector = Angle and Angle:Up()
		Angle:RotateAroundAxis(Angle:Forward(), 360 / Density)
	end
end

--keep this here, error pops up if it's removed
function EFFECT:Render()
end

