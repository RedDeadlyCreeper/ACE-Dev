-- shared.lua

DEFINE_BASECLASS("base_wire_entity")

ENT.Type              = "anim"
ENT.Base              = "base_wire_entity"
ENT.PrintName         = "ACF Missile Rack"

ENT.Spawnable         = false
ENT.AdminOnly         = false
ENT.AdminSpawnable    = false

local Weapons = ACF.Weapons.Guns
local Racks = ACF.Weapons.Racks

local function VerifyMountData(mountpoint)

	mountpoint.pos = mountpoint.pos or vector_origin
	mountpoint.offset = mountpoint.offset or vector_origin
	mountpoint.scaledir = mountpoint.scaledir or vector_origin

	return mountpoint
end

function ENT:GetMunitionAngPos(missile, _, attachname)

	local GunData = Weapons[missile.BulletData.Id]
	local RackData	= Racks[self.Id]

	if GunData and RackData then

		local offset = (GunData.modeldiameter or GunData.caliber) / (2.54 * 2)

		local mountpoint = VerifyMountData(RackData.mountpoints[attachname])
		local inverted = RackData.inverted or false

		local pos = self:LocalToWorld(mountpoint.pos + mountpoint.offset + mountpoint.scaledir * offset) 

		debugoverlay.Cross(pos, 5, 5, Color(0,255,0,255), true)

		return inverted, pos
	end
end

function ENT:GetMuzzle(shot, missile)
	shot = (shot or 0) + 1

	local attachname		= "missile" .. shot
	local inverted, pos  = self:GetMunitionAngPos(missile, attach, attachname)
	if attach ~= 0 then return attach, inverted, pos  end

	attachname			= "missile1"
	local inverted, pos  = self:GetMunitionAngPos(missile, attach, attachname)
	if attach ~= 0 then return attach, inverted, pos end

	attachname			= "muzzle"
	local inverted, pos  = self:GetMunitionAngPos(missile, attach, attachname)
	if attach ~= 0 then return attach, inverted, pos end

	return 0, false, pos
end
