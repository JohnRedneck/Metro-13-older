/obj/map_metadata/city
	ID = MAP_CITY
	title = "City (150x150x1)"
	prishtina_blocking_area_types = list(/area/prishtina/no_mans_land/invisible_wall)
	respawn_delay = 2400
	squad_spawn_locations = FALSE
	supply_points_per_tick = list(
		GERMAN = 1.00,
		SOVIET = 1.50)
	faction_organization = list(
		GERMAN,
		SOVIET,
		PARTISAN,
		CIVILIAN,
		ITALIAN)
	available_subfactions = list(
		SCHUTZSTAFFEL = 33,
		ITALIAN = 33
		)
	faction_distribution_coeffs = list(GERMAN = 0.42, SOVIET = 0.58)
	battle_name = "Battle of Kiev"

/obj/map_metadata/city/germans_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 9000 || admin_ended_all_grace_periods)

/obj/map_metadata/city/soviets_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 9000 || admin_ended_all_grace_periods)

/obj/map_metadata/city/announce_mission_start(var/preparation_time)
	world << "<font size=4>All factions have <b>15 minutes</b> to prepare before combat will begin!</font>"

/obj/map_metadata/city/reinforcements_ready()
	return (germans_can_cross_blocks() && soviets_can_cross_blocks())
	
/obj/map_metadata/city/job_enabled_specialcheck(var/datum/job/J)
	. = TRUE
	if (istype(J, /datum/job/partisan/civilian))
		J.total_positions = max(round(clients.len, 15))
		if (istype(J, /datum/job/partisan/civilian/chef))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/det))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/preist))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/fire))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/cop))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/worker))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/rich))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/sci))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/mayor))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/librarian))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/jewl))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/journalist))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/writer))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/hunter))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/doctor))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/vio))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/americanspy))
			J.total_positions = 0
		if (istype(J, /datum/job/partisan/civilian/redcross))
			J.total_positions = 5
	return .
