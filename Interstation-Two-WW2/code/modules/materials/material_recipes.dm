var/list/engineer_exclusive_recipe_types = list(/obj/structure/girder, /obj/structure/anti_tank)

/material/proc/get_recipes()
	if(!recipes)
		generate_recipes()
	return recipes

/material/proc/generate_recipes()
	recipes = list()

	// If is_brittle() returns true, these are only good for a single strike.
	recipes += new/datum/stack_recipe("[display_name] ashtray", /obj/item/weapon/material/ashtray, 2, _one_per_turf = TRUE, _on_floor = TRUE, _supplied_material = "[name]")
	recipes += new/datum/stack_recipe("[display_name] spoon", /obj/item/weapon/material/kitchen/utensil/spoon/plastic, TRUE, _on_floor = TRUE, _supplied_material = "[name]")

	if(integrity>=50)
	//	recipes += new/datum/stack_recipe("[display_name] door", /obj/machinery/door/unpowered/simple, 10, _time = 35, _one_per_turf = TRUE, _on_floor = TRUE, _supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] barricade", /obj/structure/barricade, 5, _time = 35, _one_per_turf = TRUE, _on_floor = TRUE, _supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] stool", /obj/item/weapon/stool, _one_per_turf = TRUE, _on_floor = TRUE, _supplied_material = "[name]")
		if (!istype(src, /material/wood))
			recipes += new/datum/stack_recipe("[display_name] chair", /obj/structure/bed/chair, _one_per_turf = TRUE, _on_floor = TRUE, _supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] bed", /obj/structure/bed, 2, _one_per_turf = TRUE, _on_floor = TRUE, _supplied_material = "[name]")

	if(hardness>50)
		recipes += new/datum/stack_recipe("[display_name] fork", /obj/item/weapon/material/kitchen/utensil/fork/plastic, TRUE, _on_floor = TRUE, _supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] knife", /obj/item/weapon/material/kitchen/utensil/knife/plastic, TRUE, _on_floor = TRUE, _supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] blade", /obj/item/weapon/material/butterflyblade, 6, _time = 15, _one_per_turf = FALSE, _on_floor = TRUE, _supplied_material = "[name]")

/material/steel/generate_recipes()
	..()
/*	recipes += new/datum/stack_recipe_list("office chairs",list( \
		new/datum/stack_recipe("dark office chair", /obj/structure/bed/chair/office/dark, 5, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("light office chair", /obj/structure/bed/chair/office/light, 5, _one_per_turf = TRUE, _on_floor = TRUE) \
		))*/

	recipes += new/datum/stack_recipe_list("comfy chairs", list( \
		new/datum/stack_recipe("beige comfy chair", /obj/structure/bed/chair/comfy/beige, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("black comfy chair", /obj/structure/bed/chair/comfy/black, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("brown comfy chair", /obj/structure/bed/chair/comfy/brown, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("lime comfy chair", /obj/structure/bed/chair/comfy/lime, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("teal comfy chair", /obj/structure/bed/chair/comfy/teal, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("red comfy chair", /obj/structure/bed/chair/comfy/red, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("blue comfy chair", /obj/structure/bed/chair/comfy/blue, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("purple comfy chair", /obj/structure/bed/chair/comfy/purp, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		new/datum/stack_recipe("green comfy chair", /obj/structure/bed/chair/comfy/green, 2, _one_per_turf = TRUE, _on_floor = TRUE), \
		))


	recipes += new/datum/stack_recipe_list("floor tile", list( \
		new/datum/stack_recipe("regular floor tile", /obj/item/stack/tile/floor, TRUE, 4, 20), \
		new/datum/stack_recipe("grey techfloor tile", /obj/item/stack/tile/floor/techgrey, TRUE, 4, 20), \
		new/datum/stack_recipe("grid techfloor tile", /obj/item/stack/tile/floor/techgrid, TRUE, 4, 20), \
		))

	recipes += new/datum/stack_recipe("table frame", /obj/structure/table, TRUE, _time = 7, _one_per_turf = TRUE, _on_floor = TRUE)
//	recipes += new/datum/stack_recipe("rack", /obj/structure/table/rack, TRUE, _time = 5, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("closet", /obj/structure/closet, 2, _time = 10, _one_per_turf = TRUE, _on_floor = TRUE)

	recipes += new/datum/stack_recipe("metal rod", /obj/item/stack/rods, TRUE, 2, 60)
	recipes += new/datum/stack_recipe("wall girders", /obj/structure/girder, 2, _time = 50, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("railing", /obj/structure/railing, 2, _time = 50, _one_per_turf = FALSE, _on_floor = TRUE)

	recipes += new/datum/stack_recipe("grenade casing", /obj/item/weapon/grenade/chem_grenade)
//	recipes += new/datum/stack_recipe("light fixture frame", /obj/item/frame/light, 2)
//	recipes += new/datum/stack_recipe("small light fixture frame", /obj/item/frame/light/small, TRUE)
	recipes += new/datum/stack_recipe("unlocked door", /obj/structure/simple_door/key_door/anyone, 5, _time = 35, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("locked door", /obj/structure/simple_door/key_door/anyone, 5, _time = 35, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("anti-tank hedgehog", /obj/structure/anti_tank, 15, _time = 60, _one_per_turf = TRUE, _on_floor = TRUE)

/material/plasteel/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("Metal crate", /obj/structure/closet/crate, 10, _time = 35, _one_per_turf = TRUE)
	recipes += new/datum/stack_recipe("knife grip", /obj/item/weapon/material/butterflyhandle, 4, _time = 15, _one_per_turf = FALSE, _on_floor = TRUE, _supplied_material = "[name]")
	recipes += new/datum/stack_recipe("dark floor tile", /obj/item/stack/tile/floor/dark, TRUE, 4, 20)

/material/sandstone/generate_recipes()
	..()

/material/plastic/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("plastic crate", /obj/structure/closet/crate/plastic, 10, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("plastic bag", /obj/item/weapon/storage/bag/plasticbag, 3, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("blood pack", /obj/item/weapon/reagent_containers/blood/empty, 4, _on_floor = FALSE)

	recipes += new/datum/stack_recipe("white floor tile", /obj/item/stack/tile/floor/white, TRUE, 4, 20)
	recipes += new/datum/stack_recipe("freezer floor tile", /obj/item/stack/tile/floor/freezer, TRUE, 4, 20)

/material/wood/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("wooden sandals", /obj/item/clothing/shoes/sandal, TRUE)
	recipes += new/datum/stack_recipe("wood floor tile", /obj/item/stack/tile/wood, TRUE, 4, 20)
	recipes += new/datum/stack_recipe("wooden chair", /obj/structure/bed/chair/wood, 3, _time = 7, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("coffin", /obj/structure/closet/coffin, 5, _time = 10, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("book shelf", /obj/structure/bookcase, 5, _time = 10, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("unlocked wood door", /obj/structure/simple_door/key_door/anyone/wood, 5, _time = 30, _one_per_turf = TRUE, _on_floor = TRUE)
	recipes += new/datum/stack_recipe("locked wood door", /obj/structure/simple_door/key_door/anyone/wood, 5, _time = 30, _one_per_turf = TRUE, _on_floor = TRUE)

/material/cardboard/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("box", /obj/item/weapon/storage/box)
	recipes += new/datum/stack_recipe("donut box", /obj/item/weapon/storage/box/donut/empty)
	recipes += new/datum/stack_recipe("egg box", /obj/item/weapon/storage/fancy/egg_box)
	recipes += new/datum/stack_recipe("light tubes box", /obj/item/weapon/storage/box/lights/tubes)
	recipes += new/datum/stack_recipe("light bulbs box", /obj/item/weapon/storage/box/lights/bulbs)
	recipes += new/datum/stack_recipe("mouse traps box", /obj/item/weapon/storage/box/mousetraps)
//	recipes += new/datum/stack_recipe("cardborg suit", /obj/item/clothing/suit/cardborg, 3)
//	recipes += new/datum/stack_recipe("cardborg helmet", /obj/item/clothing/head/cardborg)
//	recipes += new/datum/stack_recipe("pizza box", /obj/item/pizzabox)
	recipes += new/datum/stack_recipe_list("folders",list( \
		new/datum/stack_recipe("blue folder", /obj/item/weapon/folder/blue), \
		new/datum/stack_recipe("grey folder", /obj/item/weapon/folder), \
		new/datum/stack_recipe("red folder", /obj/item/weapon/folder/red), \
		new/datum/stack_recipe("white folder", /obj/item/weapon/folder/white), \
		new/datum/stack_recipe("yellow folder", /obj/item/weapon/folder/yellow), \
		))

/material/barbedwire/generate_recipes()
	recipes = list(new/datum/stack_recipe("barbwire", /obj/structure/barbwire, _time = 20))

/material/rope/generate_recipes()
	recipes = list(new/datum/stack_recipe("noose", /obj/structure/noose, _time = 20))

/material/glass/generate_recipes()
	recipes = list(new/datum/stack_recipe("window", /obj/structure/window/classic, _time = 30, _one_per_turf = TRUE, _on_floor = TRUE))
