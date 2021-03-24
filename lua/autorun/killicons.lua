--[[----------------------------------------------------------------------------

	Even bigger hack to get killicons

	Basically copied and modified default (base gamemode) functions.

	Functions which process next string:
		"PlayerKilledByPlayer";
		"PlayerKilled";
		"PlayerKilledNPC";
		"NPCKilledNPC"
	are copied from 'cl_deathnotice.lua' to this file and
	'attached' to next network strings accordingly:
		"ACF_PlayerKilledByPlayer";
		"ACF_PlayerKilled";
		"ACF_PlayerKilledNPC";
		"ACF_NPCKilledNPC"

	Data sent through these network strings is generated by functions
	ACF_OnNPCKilled and ACF_PlayerDeath which are hooked to functions
	OnNPCKilled and PlayerDeath	and are their modified copies.

	They are modified to check if inflictor entity has 'ACF' table
	attached and if so to send its ACF class.

------------------------------------------------------------------------------]]
AddCSLuaFile()

if SERVER then
	if ACF.EnableKillicons then
		util.AddNetworkString( "ACF_PlayerKilledNPC" )
		util.AddNetworkString( "ACF_NPCKilledNPC" )

		local function ACF_OnNPCKilled( ent, attacker, inflictor )
			-- Don't spam the killfeed with scripted stuff
			if ( ent:GetClass() == "npc_bullseye" || ent:GetClass() == "npc_launcher" ) then return end

			if ( IsValid( attacker ) && attacker:GetClass() == "trigger_hurt" ) then attacker = ent end

			if ( IsValid( attacker ) && attacker:IsVehicle() && IsValid( attacker:GetDriver() ) ) then
				attacker = attacker:GetDriver()
			end

			if ( !IsValid( inflictor ) && IsValid( attacker ) ) then
				inflictor = attacker
			end

			-- Convert the inflictor to the weapon that they're holding if we can.
			if ( IsValid( inflictor ) && attacker == inflictor && ( inflictor:IsPlayer() || inflictor:IsNPC() ) ) then

				inflictor = inflictor:GetActiveWeapon()
				if ( !IsValid( attacker ) ) then inflictor = attacker end

			end

			local InflictorClass = "worldspawn"
			local AttackerClass = "worldspawn"

			if ( IsValid( inflictor ) ) then
				if inflictor.ACF and inflictor.Class and inflictor:GetClass() != "acf_ammo" then
					InflictorClass = "acf_" .. inflictor.Class
				else
					InflictorClass = inflictor:GetClass()
				end
			end

			if ( IsValid( attacker ) ) then

				AttackerClass = attacker:GetClass()

				if ( attacker:IsPlayer() ) then

					net.Start( "ACF_PlayerKilledNPC" )

						net.WriteString( ent:GetClass() )
						net.WriteString( InflictorClass )
						net.WriteEntity( attacker )

					net.Broadcast()

					return
				end

			end

			if ( ent:GetClass() == "npc_turret_floor" ) then AttackerClass = ent:GetClass() end

			net.Start( "ACF_NPCKilledNPC" )

				net.WriteString( ent:GetClass() )
				net.WriteString( InflictorClass )
				net.WriteString( AttackerClass )

			net.Broadcast()
		end
		hook.Add( "OnNPCKilled", "ACF_OnNPCKilled", ACF_OnNPCKilled )

		util.AddNetworkString( "ACF_PlayerKilled" )
		util.AddNetworkString( "ACF_PlayerKilledSelf" )
		util.AddNetworkString( "ACF_PlayerKilledByPlayer" )

		local function ACF_PlayerDeath( ply, inflictor, attacker )

			if ( IsValid( attacker ) && attacker:GetClass() == "trigger_hurt" ) then attacker = ply end

			if ( IsValid( attacker ) && attacker:IsVehicle() && IsValid( attacker:GetDriver() ) ) then
				attacker = attacker:GetDriver()
			end

			if ( !IsValid( inflictor ) && IsValid( attacker ) ) then
				inflictor = attacker
			end

			-- Convert the inflictor to the weapon that they're holding if we can.
			-- This can be right or wrong with NPCs since combine can be holding a
			-- pistol but kill you by hitting you with their arm.
			local InflictorClass = "worldspawn"

			if ( IsValid( inflictor ) && inflictor == attacker && ( inflictor:IsPlayer() || inflictor:IsNPC() ) ) then

				inflictor = inflictor:GetActiveWeapon()
				if ( !IsValid( inflictor ) ) then inflictor = attacker end
			end

			if inflictor.ACF and inflictor:GetClass() != "acf_ammo" then
				InflictorClass = "acf_" .. (inflictor.Class or "gun")
			else
				InflictorClass = inflictor:GetClass()
			end

			if ( attacker == ply ) then return end

			if ( attacker:IsPlayer() ) then

				net.Start( "ACF_PlayerKilledByPlayer" )

					net.WriteEntity( ply )
					net.WriteString( InflictorClass )
					net.WriteEntity( attacker )

				net.Broadcast()

				return
			end

			net.Start( "ACF_PlayerKilled" )

				net.WriteEntity( ply )
				net.WriteString( InflictorClass )
				net.WriteString( attacker:GetClass() )

			net.Broadcast()
		end
		hook.Add( "PlayerDeath", "ACF_PlayerDeath", ACF_PlayerDeath )
	end
end

if CLIENT then
	local IconColor = Color( 200, 200, 48, 255 )

	killicon.Add( "acf_gun", "HUD/killicons/acf_gun", IconColor )
	killicon.Add( "acf_ammo", "HUD/killicons/acf_ammo", IconColor )
	killicon.Add( "torch", "HUD/killicons/torch", IconColor )

	if ACF.EnableKillicons then
		killicon.Add( "acf_AC", "HUD/killicons/acf_AC", IconColor )
		killicon.Add( "acf_AL", "HUD/killicons/acf_AL", IconColor )
		killicon.Add( "acf_C", "HUD/killicons/acf_C", IconColor )
		killicon.Add( "acf_GL", "HUD/killicons/acf_GL", IconColor )
		killicon.Add( "acf_HMG", "HUD/killicons/acf_HMG", IconColor )
		killicon.Add( "acf_HW", "HUD/killicons/acf_HW", IconColor )
		killicon.Add( "acf_MG", "HUD/killicons/acf_MG", IconColor )
		killicon.Add( "acf_MO", "HUD/killicons/acf_MO", IconColor )
		killicon.Add( "acf_RAC", "HUD/killicons/acf_RAC", IconColor )
		killicon.Add( "acf_SA", "HUD/killicons/acf_SA", IconColor )

		local function doNothing()
			return false
		end

		net.Receive( "PlayerKilledByPlayer", doNothing )
		net.Receive( "PlayerKilled", doNothing )

		net.Receive( "PlayerKilledNPC", doNothing )
		net.Receive( "NPCKilledNPC", doNothing )

		local function RecvPlayerKilledByPlayer()

			local victim	= net.ReadEntity()
			local inflictor	= net.ReadString()
			local attacker	= net.ReadEntity()

			if ( !IsValid( attacker ) ) then return end
			if ( !IsValid( victim ) ) then return end

			GAMEMODE:AddDeathNotice( attacker:Name(), attacker:Team(), inflictor, victim:Name(), victim:Team() )

		end
		net.Receive( "ACF_PlayerKilledByPlayer", RecvPlayerKilledByPlayer )

		local function RecvPlayerKilledSelf()

			local victim = net.ReadEntity()
			if ( !IsValid( victim ) ) then return end
			GAMEMODE:AddDeathNotice( nil, 0, "suicide", victim:Name(), victim:Team() )

		end
		net.Receive( "ACF_PlayerKilledSelf", RecvPlayerKilledSelf )

		local function RecvPlayerKilled()

			local victim	= net.ReadEntity()
			if ( !IsValid( victim ) ) then return end
			local inflictor	= net.ReadString()
			local attacker	= "#" .. net.ReadString()

			GAMEMODE:AddDeathNotice( attacker, -1, inflictor, victim:Name(), victim:Team() )

		end
		net.Receive( "ACF_PlayerKilled", RecvPlayerKilled )

		local function RecvPlayerKilledNPC()

			local victimtype = net.ReadString()
			local victim	= "#" .. victimtype
			local inflictor	= net.ReadString()
			local attacker	= net.ReadEntity()

			--
			-- For some reason the killer isn't known to us, so don't proceed.
			--
			if ( !IsValid( attacker ) ) then return end

			GAMEMODE:AddDeathNotice( attacker:Name(), attacker:Team(), inflictor, victim, -1 )

			local bIsLocalPlayer = ( IsValid(attacker) && attacker == LocalPlayer() )

			local bIsEnemy = IsEnemyEntityName( victimtype )
			local bIsFriend = IsFriendEntityName( victimtype )

			if ( bIsLocalPlayer && bIsEnemy ) then
				achievements.IncBaddies()
			end

			if ( bIsLocalPlayer && bIsFriend ) then
				achievements.IncGoodies()
			end

			if ( bIsLocalPlayer && ( !bIsFriend && !bIsEnemy ) ) then
				achievements.IncBystander()
			end

		end
		net.Receive( "ACF_PlayerKilledNPC", RecvPlayerKilledNPC )

		local function RecvNPCKilledNPC()

			local victim	= "#" .. net.ReadString()
			local inflictor	= net.ReadString()
			local attacker	= "#" .. net.ReadString()

			GAMEMODE:AddDeathNotice( attacker, -1, inflictor, victim, -1 )

		end
		net.Receive( "ACF_NPCKilledNPC", RecvNPCKilledNPC )
	end
end