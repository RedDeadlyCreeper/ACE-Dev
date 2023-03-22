--general
E2Helper.Descriptions["acfIsEngine"] = "Returns 1 if the entity is an ACF engine."
E2Helper.Descriptions["acfIsGearbox"] = "Returns 1 if the entity is an ACF gearbox."
E2Helper.Descriptions["acfIsGun"] = "Returns 1 if the entity is an ACF gun."
E2Helper.Descriptions["acfIsAmmo"] = "Returns 1 if the entity is an ACF ammo crate."
E2Helper.Descriptions["acfIsFuel"] = "Returns 1 if the entity is an ACF fuel tank."
E2Helper.Descriptions["acfActive(e:)"] = "Returns whether an ACF engine, ammo crate, or fuel tank is active"
E2Helper.Descriptions["acfActive(e:n)"] = "Sets whether an ACF engine, ammo crate, or fuel tank is active"
E2Helper.Descriptions["acfHitClip"] = "Returns 1 if hitpos is on a clipped part of prop"
E2Helper.Descriptions["acfNameShort"] = "Returns the short name of an ACF entity."
E2Helper.Descriptions["acfName"] = "Returns the full name of an ACF entity."
E2Helper.Descriptions["acfType"] = "Returns the type of ACF entity."
E2Helper.Descriptions["acfLinkTo"] = "Link various ACF components together."
E2Helper.Descriptions["acfUnlinkFrom"] = "Unlink various ACF components."
E2Helper.Descriptions["acfCapacity"] = "Returns the capacity of an ACF ammo crate or fuel tank."
E2Helper.Descriptions["acfInfoRestricted"] = "Returns 1 if functions returning sensitive info are restricted to owned props."
E2Helper.Descriptions["acfLinks"] = "Returns all the entities which are linked to this entity through ACF."
E2Helper.Descriptions["acfGetLinkedWheels"] = "Returns any wheels linked to this engine/gearbox or its children links."
E2Helper.Descriptions["acfDragDiv"] = "Returns current ACF drag divisor"

--engine
E2Helper.Descriptions["acfMaxTorque"] = "Returns the maximum torque (in N/m) of an ACF engine."
E2Helper.Descriptions["acfMaxPower"] = "Returns the maximum power (in kW) of an ACF engine."
E2Helper.Descriptions["acfMaxTorqueWithFuel"] = "Returns the maximum torque (in N/m) of an ACF engine with fuel linked."
E2Helper.Descriptions["acfMaxPowerWithFuel"] = "Returns the maximum power (in kW) of an ACF engine with fuel linked."
E2Helper.Descriptions["acfIdleRPM"] = "Returns the idle RPM of an ACF engine."
E2Helper.Descriptions["acfPowerbandMin"] = "Returns the powerband minimum of an ACF engine."
E2Helper.Descriptions["acfPowerbandMax"] = "Returns the powerband maximum of an ACF engine."
E2Helper.Descriptions["acfRedline"] = "Returns the redline RPM of an ACF engine."
E2Helper.Descriptions["acfRPM"] = "Returns the current RPM of an ACF engine."
E2Helper.Descriptions["acfTorque"] = "Returns the current torque (in N/m) of an ACF engine."
E2Helper.Descriptions["acfFlyInertia"] = "Returns the inertia of an ACF engine's flywheel"
E2Helper.Descriptions["acfFlyMass"] = "Returns the mass of an ACF engine's flywheel."
E2Helper.Descriptions["acfPower"] = "Returns the current power (in kW) of an ACF engine."
E2Helper.Descriptions["acfInPowerband"] = "Returns 1 if the ACF engine RPM is inside the powerband."
E2Helper.Descriptions["acfThrottle(e:)"] = "Gets throttle (0-100) for an ACF engine."
E2Helper.Descriptions["acfThrottle(e:n)"] = "Sets throttle (0-100) for an ACF engine."

--gearbox
E2Helper.Descriptions["acfGear"] = "Returns the current gear of an ACF gearbox."
E2Helper.Descriptions["acfNumGears"] = "Returns the number of gears of an ACF gearbox."
E2Helper.Descriptions["acfFinalRatio"] = "Returns the final ratio of an ACF gearbox."
E2Helper.Descriptions["acfTorqueRating"] = "Returns the maximum torque (in N/m) an ACF gearbox can handle."
E2Helper.Descriptions["acfIsDual"] = "Returns 1 if an ACF gearbox is dual clutch."
E2Helper.Descriptions["acfShiftTime"] = "Returns the time in ms an ACF gearbox takes to change gears."
E2Helper.Descriptions["acfInGear"] = "Returns 1 if an ACF gearbox is in gear."
E2Helper.Descriptions["acfTotalRatio"] = "Returns the total ratio (current gear * final) of an ACF gearbox."
E2Helper.Descriptions["acfGearRatio"] = "Returns the ratio of a specified gear of an ACF gearbox."
E2Helper.Descriptions["acfTorqueOut"] = "Returns the current torque output (in N/m) an ACF gearbox. A bit jumpy due to how ACF applies power."
E2Helper.Descriptions["acfCVTRatio"] = "Sets the gear ratio of a CVT.  Passing 0 causes the CVT to resume using target min/max rpm calculation."
E2Helper.Descriptions["acfShift"] = "Shift to the specified gear for an ACF gearbox."
E2Helper.Descriptions["acfShiftUp"] = "Set an ACF gearbox to shift up."
E2Helper.Descriptions["acfShiftDown"] = "Set an ACF gearbox to shift down."
E2Helper.Descriptions["acfBrake"] = "Sets the brake for an ACF gearbox. Sets both sides of a dual clutch gearbox."
E2Helper.Descriptions["acfBrakeLeft"] = "Sets the left brake for an ACF gearbox. Only works for dual clutch."
E2Helper.Descriptions["acfBrakeRight"] = "Sets the right brake for an ACF gearbox. Only works for dual clutch."
E2Helper.Descriptions["acfClutch"] = "Sets the clutch for an ACF gearbox. Sets both sides of a dual clutch gearbox."
E2Helper.Descriptions["acfClutchLeft"] = "Sets the left clutch for an ACF gearbox. Only works for dual clutch."
E2Helper.Descriptions["acfClutchRight"] = "Sets the right clutch for an ACF gearbox. Only works for dual clutch."
E2Helper.Descriptions["acfSteerRate"] = "Sets the steer ratio for an ACF double differential gearbox."
E2Helper.Descriptions["acfHoldGear"] = "Set to 1 to stop ACF automatic gearboxes upshifting."
E2Helper.Descriptions["acfShiftPointScale"] = "Sets the shift point scale for an ACF automatic gearbox."

--guns
E2Helper.Descriptions["acfIsReloading"] = "Returns 1 if an ACF weapon is reloading."
E2Helper.Descriptions["acfReady"] = "Returns 1 if an ACF weapon is ready to fire."
E2Helper.Descriptions["acfMagSize"] = "Returns the magazine capacity of an ACF weapon."
E2Helper.Descriptions["acfMagfReloadTime"] = "Returns time it takes for an ACF weapon to reload magazine."
E2Helper.Descriptions["acfReloadTime"] = "Returns time to next shot of an ACF weapon."
E2Helper.Descriptions["acfReloadProgress"] = "Returns number between 0 and 1 which represents reloading progress of an ACF weapon. Useful for progress bars."
E2Helper.Descriptions["acfSpread"] = "Returns the spread of an ACF weapon."
E2Helper.Descriptions["acfFireRate"] = "Returns the rate of fire of an ACF weapon."
E2Helper.Descriptions["acfSetROFLimit"] = "Sets the rate of fire limit of an ACF weapon."
E2Helper.Descriptions["acfFire"] = "Sets the firing state of an ACF weapon.  Kills are only attributed to gun owner.  Use wire inputs on gun if you want to properly attribute kills to driver."
E2Helper.Descriptions["acfUnload"] = "Causes an ACF weapon to unload."
E2Helper.Descriptions["acfReload"] = "Causes an ACF weapon to reload."
E2Helper.Descriptions["acfMagRounds"] = "Returns the rounds remaining in the magazine of an ACF weapon."
E2Helper.Descriptions["acfAmmoCount"] = "Returns the number of rounds in active ammo crates linked to an ACF weapon."
E2Helper.Descriptions["acfTotalAmmoCount"] = "Returns the number of rounds in all ammo crates linked to an ACF weapon."

--ammo
E2Helper.Descriptions["acfRounds"] = "Returns the number of rounds in an ACF ammo crate."
E2Helper.Descriptions["acfAmmoType"] = "Returns the type of ammo in an ACF ammo crate or ACF weapon."
E2Helper.Descriptions["acfRoundType"] = "Returns the type of weapon the ammo in an ACF ammo crate loads into."
E2Helper.Descriptions["acfCaliber"] = "Returns the caliber of the weapon or ammo."
E2Helper.Descriptions["acfMuzzleVel"] = "Returns the muzzle velocity of the ammo in an ACF ammo crate or weapon."
E2Helper.Descriptions["acfProjectileMass"] = "Returns the mass of the projectile in an ACF ammo crate or weapon."
E2Helper.Descriptions["acfFLSpikes"] = "Returns the number of projectiles in a flechette round."
E2Helper.Descriptions["acfFLSpikeRadius"] = "Returns the radius (in mm) of the spikes in a flechette round."
E2Helper.Descriptions["acfFLSpikeMass"] = "Returns the mass of a single spike in a FL round in a crate or gun."
E2Helper.Descriptions["acfPenetration"] = "Returns the penetration of an AP, APHE, HEAT or FL round in an ACF ammo crate or weapon."
E2Helper.Descriptions["acfBlastRadius"] = "Returns the blast radius of an HE, APHE, or HEAT round in an ACF ammo crate or weapon."
E2Helper.Descriptions["acfDragCoef"] = "Returns the drag coefficient of ammo in an ACF ammo crate or weapon."

--armor
E2Helper.Descriptions["acfPropHealth"] = "Returns the current health of an entity."
E2Helper.Descriptions["acfPropHealthMax"] = "Returns the max health of an entity."
E2Helper.Descriptions["acfPropArmor"] = "Returns the current armor of an entity."
E2Helper.Descriptions["acfPropArmorMax"] = "Returns the max armor of an entity."
E2Helper.Descriptions["acfPropDuctility"] = "Returns the ductility of an entity."
E2Helper.Descriptions["acfEffectiveArmor"] = "Returns the effective armor of a given nominal armor value and angle, or from a trace hitting an entity."
E2Helper.Descriptions["acfPropMaterial"] = "Returns the material of an entity."
E2Helper.Descriptions["acfPropArmorData"] = "Returns a table with armor data of the prop. Keys:\nCurve = [N]\nEffectiveness = [N]\nHEATEffectiveness = [N]\nMaterial = [S]"

--fuel
E2Helper.Descriptions["acfFuel"] = "Returns the remaining liters of fuel or kilowatt hours in an ACF fuel tank, or available to an engine."
E2Helper.Descriptions["acfFuelLevel"] = "Returns the percent remaining fuel in an ACF fuel tank, or available to an engine."
E2Helper.Descriptions["acfFuelRequired"] = "Returns 1 if an ACF engine requires fuel."
E2Helper.Descriptions["acfRefuelDuty"] = "Sets an ACF fuel tank on refuel duty, causing it to supply other fuel tanks with fuel."
E2Helper.Descriptions["acfFuelUse"] = "Returns the current fuel consumption of an engine in liters per minute or kilowatts."
E2Helper.Descriptions["acfPeakFuelUse"] = "Returns the peak fuel consumption of an engine in liters per minute or kilowatts."

--radars
E2Helper.Descriptions["acfRadarData"] = "Returns a table containing the outputs you'd get from an ACF tracking radar, missile radar, or IRST.\nCheck radar wire outputs for key names."