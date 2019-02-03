/obj/map_metadata/saipan
	ID = MAP_SAIPAN
	title = "Saipan (100x120x1)"
	lobby_icon_state = "pacific"
	prishtina_blocking_area_types = list(/area/prishtina/no_mans_land/invisible_wall/)
	respawn_delay = 1200
	squad_spawn_locations = FALSE
//	reinforcements = FALSE
//	min_autobalance_players = 90
	supply_points_per_tick = list(
		USA = 1.00,
		JAPAN = 1.50)
//	supply_points_per_tick = list(
//		GERMAN = 1.00,
//		SOVIET = 1.50)
	faction_organization = list(
		USA,
		JAPAN)
	available_subfactions = list(
		)
	roundend_condition_sides = list(
		list(JAPAN) = /area/prishtina/island/beach,
		list(USA) = /area/prishtina/farm4 // area inexistent in this map, in order to prevent the americans from winning by capture
		)
	front = "Pacific"
	faction_distribution_coeffs = list(USA = 0.3, JAPAN = 0.7)
	songs = list(
		"Song of the Kamikaze:1" = 'sound/music/kamikaze.ogg',
		"Blood On the Risers(Gory Gory):1" = 'sound/music/gory.ogg',
		"Battotai:1" = 'sound/music/battotai.ogg',
		"American March:1" = 'sound/music/american_march.ogg',
		"Marine's Hymn (Halls of Montezuma):1" = 'sound/music/montezuma.ogg',
		)
	meme = FALSE
	battle_name = "Battle of Saipan"

/obj/map_metadata/saipan/germans_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 9000 || admin_ended_all_grace_periods)

/obj/map_metadata/saipan/soviets_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 9000 || admin_ended_all_grace_periods)

/obj/map_metadata/island/announce_mission_start(var/preparation_time)
	world << "<font size=4>All factions have <b>10 minutes</b> to prepare before the ceasefire ends!<br>The Japanese will win if they succesfully take the beach in thier ,<b>banzai attack!,</b>. The Americans will win if they hold the beach for 40 minutes and repel the Japanese banzai attack!.</font>"

/obj/map_metadata/island/reinforcements_ready()
	return (germans_can_cross_blocks() && soviets_can_cross_blocks())

/obj/map_metadata/island/short_win_time(faction)
	return 1200

/obj/map_metadata/island/long_win_time(faction)
	return 3000

var/no_loop_s = FALSE
/obj/map_metadata/saipan/job_enabled_specialcheck(var/datum/job/J)
	. = TRUE
	if (istype(J, /datum/job/usa))
		if (J.is_prisoner)
			. = FALSE
//	if (istype(J, /datum/job/japanese))
//		if (J.is_SSTV)
//			. = FALSE
/obj/map_metadata/island/update_win_condition()
	if (!win_condition_specialcheck())
		return FALSE
	if (world.time >= 36000)
		if (win_condition_spam_check)
			return FALSE
		ticker.finished = TRUE
		var/message = "The <b>Americans</b> have sucessfuly defended the Island! The Japanese have failed the banzai attack!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		show_global_battle_report(null)
		win_condition_spam_check = TRUE
		return FALSE
	if ((current_winner && current_loser && world.time > next_win) && no_loop_s == FALSE)
		ticker.finished = TRUE
		var/message = "The <b>Japanese</b> have captured the Beach! The battle for Saipan is over!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		show_global_battle_report(null)
		win_condition_spam_check = TRUE
		no_loop_i = TRUE
		return FALSE
	// JAPAN major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The Japanese have captured the beach! They will win in {time} minutes."
				next_win = world.time + short_win_time(JAPAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	// JAPAN minor
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The Japanese have captured the beach! They will win in {time} minutes."
				next_win = world.time + short_win_time(JAPAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	// USA major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The Japanese have captured the beach! They will win in {time} minutes."
				next_win = world.time + short_win_time(JAPAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	// USA minor
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The Japanese have captured the beach! They will win in {time} minutes."
				next_win = world.time + short_win_time(JAPAN)
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	else if (win_condition.check(list("REINFORCEMENTS"), list(), list(), 1.0, TRUE))
		if (last_win_condition != win_condition.hash)

			// let us know why we're changing to this win condition
			if (current_win_condition != NO_WINNER && current_winner && current_loser)
				world << "<font size = 3>The <b>Americans</b> have recaptured the beach!</font>"

			current_win_condition = "Both sides are out of reinforcements; the round will end in {time} minute{s}."

			if (last_reinforcements_next_win != -1)
				next_win = last_reinforcements_next_win
			else
				next_win = world.time + long_win_time(null)
				last_reinforcements_next_win = next_win

			announce_current_win_condition()
			current_winner = null
			current_loser = null
	else
		if (current_win_condition != NO_WINNER && current_winner && current_loser)
			world << "<font size = 3>The <b>Americans</b> have recaptured the beach!</font>"
			current_winner = null
			current_loser = null
		next_win = -1
		current_win_condition = NO_WINNER
		win_condition.hash = 0
	last_win_condition = win_condition.hash
	return TRUE


	#undef NO_WINNER