/obj/structure/nestbox
	name = "Nesting Box"
	desc = "A warm box perfect for a chicken"
	density = FALSE
	icon = 'monkestation/icons/obj/structures.dmi'
	icon_state = "nestbox"
	anchored = FALSE


/obj/item/chicken_scanner
	name = "Chicken Scanner"
	desc = "Scans chickens to give you information about possible mutations that chicken can have"
	icon = 'icons/obj/device.dmi'
	icon_state = "health"
	inhand_icon_state = "healthanalyzer"
	worn_icon_state = "healthanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON

	slot_flags = ITEM_SLOT_BELT
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	var/scan_mode = TRUE


/obj/item/chicken_scanner/attack(mob/living/M, mob/living/carbon/human/user)
	if(!istype(M, /mob/living/simple_animal/chicken))
		return
	var/mob/living/simple_animal/chicken/scanned_chicken = M
	user.visible_message("<span class='notice'>[user] analyzes [scanned_chicken]'s possible mutations.</span>")

	chicken_scan(user, scanned_chicken)

/obj/item/chicken_scanner/AltClick(mob/user)
	. = ..()
	scan_mode = !scan_mode
	to_chat(user, "<span class='info'>Switched to Stat Mode</span>")

/obj/item/chicken_scanner/proc/chicken_scan(mob/living/carbon/human/user, mob/living/simple_animal/chicken/scanned_chicken)
	if(scan_mode)
		for(var/mutation in scanned_chicken.mutation_list)
			var/datum/mutation/ranching/chicken/held_mutation = new mutation
			var/list/combined_msg = list()
			combined_msg += "\t<span class='notice'>[initial(held_mutation.egg_type.name)]</span>"
			if(held_mutation.happiness)
				combined_msg += "\t<span class='info'>Required Happiness: [held_mutation.happiness]</span>"
			if(held_mutation.needed_temperature)
				combined_msg += "\t<span class='info'>Required Temperature: Within [held_mutation.temperature_variance] K of [held_mutation.needed_temperature] K</span>"
			if(held_mutation.needed_pressure)
				combined_msg += "\t<span class='info'>Required Pressure: Within [held_mutation.pressure_variance] Kpa of [held_mutation.needed_pressure] Kpa </span>"
			if(held_mutation.food_requirements.len)
				var/list/foods = list()
				for(var/food in held_mutation.food_requirements)
					var/obj/item/food/listed_food = food
					foods += "[initial(listed_food.name)]"
				var/food_string = foods.Join(" , ")
				combined_msg += "\t<span class='info'>Required Foods: [food_string]</span>"
			if(held_mutation.reagent_requirements.len)
				var/list/reagents = list()
				for(var/reagent in held_mutation.reagent_requirements)
					var/datum/reagent/listed_reagent = reagent
					reagents += "[initial(listed_reagent.name)]"
				var/reagent_string = reagents.Join(" , ")
				combined_msg += "\t<span class='info'>Required Reagents: [reagent_string]</span>"
			if(held_mutation.needed_turfs.len)
				var/list/turfs = list()
				for(var/tile in held_mutation.needed_turfs)
					var/turf/listed_turf = tile
					turfs += "[initial(listed_turf.name)]"
				var/turf_string = turfs.Join(" , ")
				combined_msg += "\t<span class='info'>Required Environmental Turfs: [turf_string]</span>"
			if(held_mutation.required_atmos.len)
				var/list/gases = list()
				for(var/gas in held_mutation.required_atmos)
					gases += "[held_mutation.required_atmos[gas]] Moles of [gas]"
				var/gas_string = gases.Join(" , ")
				combined_msg += "\t<span class='info'>Required Environmental Gases: [gas_string]</span>"
			if(held_mutation.required_rooster)
				var/mob/living/simple_animal/chicken/rooster_type = held_mutation.required_rooster
				var/rooster_name = ""
				if(rooster_type.breed_name_male)
					rooster_name = initial(rooster_type.breed_name_male)
				else
					rooster_name = initial(rooster_type.name)
				combined_msg += "\t<span class='info'>Required Rooster:[rooster_name]</span>"
			if(held_mutation.player_job)
				combined_msg += "\t<span class='info'>Required Present Worker:[held_mutation.player_job]</span>"
			if(held_mutation.player_health)
				combined_msg += "\t<span class='info'>Requires Injured Personnel with atleast [held_mutation.player_health] damage taken </span>"
			if(held_mutation.needed_species)
				var/datum/species/species_type = held_mutation.needed_species
				combined_msg += "\t<span class='info'>Requires Present Worker that is a [initial(species_type.name)]</span>"
			if(held_mutation.liquid_depth)
				var/depth_name = ""
				switch(held_mutation.liquid_depth)
					if(0 to LIQUID_ANKLES_LEVEL_HEIGHT-1)
						depth_name = "A puddle"
					if(LIQUID_ANKLES_LEVEL_HEIGHT to LIQUID_WAIST_LEVEL_HEIGHT-1)
						depth_name = "ankle deep"
					if(LIQUID_WAIST_LEVEL_HEIGHT to LIQUID_SHOULDERS_LEVEL_HEIGHT-1)
						depth_name = "waist deep"
					if(LIQUID_SHOULDERS_LEVEL_HEIGHT to LIQUID_FULLTILE_LEVEL_HEIGHT-1)
						depth_name = "shoulder deep"
					if(LIQUID_FULLTILE_LEVEL_HEIGHT to INFINITY)
						depth_name = "above head height"
				combined_msg += "\t<span class='info'>Requires liquid that is atleast [depth_name]</span>"

			to_chat(user, examine_block(combined_msg.Join("\n")))
	else
		var/list/combined_msg = list()
		combined_msg += "\t <span class='info'>Age:[scanned_chicken.age]</span>"
		combined_msg += "\t <span class='info'>Happiness:[round(scanned_chicken.happiness, 1)]</span>"
		to_chat(user, examine_block(combined_msg.Join("\n")))

/datum/design/chicken_scanner
	name = "Chicken Scanner"
	id = "chicken_scanner"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/chicken_scanner
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/obj/machinery/feed_machine
	name = "Feed Producer"
	desc = "It converts food and reagents into usable feed for chickens. \n Alt-Click the machine in order to produce feed"

	icon = 'monkestation/icons/obj/structures.dmi'
	icon_state = "feed_producer"

	use_power = IDLE_POWER_USE
	idle_power_usage = 5
	active_power_usage = 100
	max_integrity = 300

	circuit = /obj/item/circuitboard/machine/feed_machine

	///the current held beaker used when feed is produced to add reagents to it
	var/obj/item/reagent_containers/beaker = null
	///list of all currently held foods
	var/list/held_foods = list()
	///the first food object put into the feed machine this cycle
	var/obj/item/food/first_food
	///number of food inserted
	var/food_inserted = 0

/obj/machinery/feed_machine/attacked_by(obj/item/I, mob/living/user)
	. = ..()
	if(!typesof(I, /obj/item/food) || !typesof(I, /obj/item/reagent_containers)) ///if not a food or reagent type early return
		return

	if(istype(I, /obj/item/food)) // if food we do this
		if(food_inserted > 4)
			to_chat(user, span_notice("The [src] is filled to the brim, it can't hold anymore."))
			return
		var/obj/item/food/attacked_food = I

		if(!first_food) // set the food type to this, used for color and naming
			first_food = attacked_food
		held_foods |= attacked_food.type //we add the type to this as we don't want a ton of random objects stored inside the feed
		food_inserted++
		qdel(I)

	else //if not this
		var/obj/item/reagent_containers/attacked_reagent_container = I
		if(!user.transferItemToLoc(attacked_reagent_container, src))
			return
		if(beaker)
			beaker.forceMove(drop_location())
			if(user && Adjacent(user) && !issiliconoradminghost(user))
				user.put_in_hands(beaker)
		beaker = attacked_reagent_container

/obj/machinery/feed_machine/AltClick(mob/user)
	. = ..()
	if(length(held_foods) == 0)
		return
	var/obj/item/chicken_feed/produced_feed = new(src.loc)
	produced_feed.placements_left *= food_inserted

	if(beaker && beaker.reagents)
		produced_feed.name = "[initial(first_food.name)] Chicken Feed infused with [beaker?.reagents.reagent_list[1].name]"
	else
		produced_feed.name = "[initial(first_food.name)] Chicken Feed"
	for(var/food in held_foods)
		var/obj/item/food/listed_food = new food(src.loc)
		produced_feed.held_foods |= listed_food.type
		qdel(listed_food)
	if(beaker && beaker.reagents)
		produced_feed.reagents.reagent_list |= beaker.reagents.reagent_list
		beaker.forceMove(drop_location())
		if(user && Adjacent(user) && !issiliconoradminghost(user))
			user.put_in_hands(beaker)

	first_food = list()
	held_foods = list()
	food_inserted = 0

/obj/item/chicken_feed
	name = "chicken feed"
	icon = 'monkestation/icons/obj/ranching/feed.dmi'
	icon_state = "feed_sack"

	///list of contained foods
	var/list/held_foods = list()

	///how many placements left
	var/placements_left = 5

/obj/item/chicken_feed/Initialize(mapload)
	. = ..()
	reagents = new(1000)
	var/mutable_appearance/feed_top = mutable_appearance(src.icon, "feed_seed")
	if(reagents?.reagent_list.len)
		feed_top.color = mix_color_from_reagents(reagents.reagent_list)
	else
		feed_top.color = "#cacc52"
	add_overlay(feed_top)

/obj/item/chicken_feed/afterattack(atom/attacked_atom, mob/user)
	if(!user.Adjacent(attacked_atom))
		return
	try_place(attacked_atom)

/obj/item/chicken_feed/proc/try_place(atom/target)
	if(!isopenturf(target))
		return FALSE
	var/turf/open/targetted_turf = get_turf(target)
	var/list/compiled_reagents = list()
	for(var/datum/reagent/listed_reagent in reagents.reagent_list)
		compiled_reagents += new listed_reagent
		compiled_reagents[listed_reagent] = listed_reagent.volume

	new /obj/effect/chicken_feed(targetted_turf, held_foods, compiled_reagents, mix_color_from_reagents(reagents.reagent_list), name)
	placements_left--

	if(placements_left <= 0)
		qdel(src)

/obj/effect/chicken_feed
	name = "chicken feed"
	icon = 'monkestation/icons/effects/feed.dmi'

	var/list/held_foods = list()

	var/list/held_reagents = list()

/obj/effect/chicken_feed/New(loc, list/held_foods, list/held_reagents, color, name)
	. = ..()
	src.name = name
	src.held_foods = held_foods
	src.held_reagents = held_reagents
	if(color)
		src.color = color
	else
		src.color = "#cacc52"
	icon_state = "feed_[rand(1,4)]"

/obj/item/storage/bag/egg
	name = "egg bag"
	icon = 'monkestation/icons/obj/ranching.dmi'
	icon_state = "egg_bag"
	worn_icon_state = "plantbag"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/egg/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 200
	atom_storage.max_slots = 50
	atom_storage.set_holdable(list(
		/obj/item/food/egg,
	))

/obj/machinery/egg_incubator
	name = "Incubator"
	desc = "For most eggs this can force them to hatch, that is unless a fresh mutation."
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500

	max_integrity = 300
	circuit = /obj/item/circuitboard/machine/egg_incubator

	icon = 'monkestation/icons/obj/structures.dmi'
	icon_state = "incubator"

	var/current_state = FALSE

/obj/machinery/egg_incubator/attack_hand(mob/living/user)
	. = ..()
	current_state = !current_state
	var/extra_text = current_state ? "On" : "Off"
	to_chat(user,  span_notice("You flip the [src] [extra_text]"))
	desc = null
	if(current_state)
		START_PROCESSING(SSobj, src)
		desc += "For most eggs this can force them to hatch, that is unless a fresh mutation."
		desc += "\n The incubator glows with a soft orange hue, it appears to be on."
	else
		STOP_PROCESSING(SSobj, src)
		desc += "For most eggs this can force them to hatch, that is unless a fresh mutation."
		desc += "\n The incubator appears cold and dark, unsuitable for incubation"

/obj/machinery/egg_incubator/process()
	. = ..()
	for(var/obj/item/food/egg/contained_egg in loc.contents)
		if(contained_egg.fresh_mutation)
			continue
		if(contained_egg.datum_flags & DF_ISPROCESSING)
			continue
		if(!contained_egg.layer_hen_type)
			contained_egg.layer_hen_type = /mob/living/simple_animal/chicken
		START_PROCESSING(SSobj, contained_egg)
		flop_animation(contained_egg)
		contained_egg.desc = "You can hear pecking from the inside of this seems it may hatch soon."

/obj/machinery/egg_incubator/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/storage/bag/tray))
		var/obj/item/storage/bag/tray/T = I
		if(T.contents.len > 0) // If the tray isn't empty
			I.atom_storage.remove_all(drop_location())
			user.visible_message(span_notice("[user] empties [I] on [src]."))
			return

	if(!user.combat_mode && !(I.item_flags & ABSTRACT))
		if(user.transferItemToLoc(I, drop_location(), silent = FALSE))
			var/list/click_params = params2list(params)
			//Center the icon where the user clicked.
			if(!click_params || !click_params["icon-x"] || !click_params["icon-y"])
				return
			//Clamp it so that the icon never moves more than 16 pixels in either direction (thus leaving the table turf)
			I.pixel_x = clamp(text2num(click_params["icon-x"]) - 16, -(world.icon_size/2), world.icon_size/2)
			I.pixel_y = clamp(text2num(click_params["icon-y"]) - 16, -(world.icon_size/2), world.icon_size/2)
			return TRUE
	else
		return ..()

/obj/machinery/chicken_grinder
	name = "The Grinder"
	desc = "This is how chicken nuggets are made boys and girls. \nAlt-Clicking will let you create eggs out of the dead bodies of chickens.\nUses 40 chicken essence per egg, grinded chickens give 20 essence."
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500

	///placeholder
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "grinder"

	max_integrity = 300
	circuit = /obj/item/circuitboard/machine/chicken_grinder
	///the amount of chicken soul stored
	var/stored_chicken_soul = 0

	var/static/list/grinded_types = list()

/obj/machinery/chicken_grinder/attack_hand(mob/user)
	if(machine_stat & (NOPOWER|BROKEN))
		return

	if(!anchored)
		to_chat(user, "<span class='notice'>[src] cannot be used unless bolted to the ground.</span>")
		return

	if(user.pulling && istype(user.pulling, /mob/living/simple_animal/chicken))
		var/mob/living/L = user.pulling
		var/mob/living/simple_animal/chicken/C = L
		if(C.buckled ||C.has_buckled_mobs())
			to_chat(user, "<span class='warning'>[C] is attached to something!</span>")
			return

		user.visible_message("<span class='danger'>[user] starts to put [C] into the gibber!</span>")

		add_fingerprint(user)

		if(do_after(user, 1 SECONDS, target = src))
			if(C && user.pulling == C && !C.buckled && !C.has_buckled_mobs() && !occupant)
				user.visible_message("<span class='danger'>[user] stuffs [C] into the gibber!</span>")
				C.forceMove(src)
				set_occupant(C)
				update_icon()
	else
		startgibbing(user)

/obj/machinery/chicken_grinder/proc/startgibbing(mob/user)
	if(!occupant)
		visible_message("<span class='italics'>You hear a loud metallic grinding sound.</span>")
		return
	use_power(1000)
	visible_message("<span class='italics'>You hear a loud squelchy grinding sound.</span>")
	playsound(loc, 'sound/machines/juicer.ogg', 50, 1)
	update_icon()

	var/offset = prob(50) ? -2 : 2
	animate(src, pixel_x = pixel_x + offset, time = 0.2, loop = 200) //start shaking

	var/mob/living/simple_animal/chicken/mob_occupant = occupant

	if(!(mob_occupant.chicken_path in grinded_types))
		grinded_types |= mob_occupant.type
	log_combat(user, occupant, "gibbed")
	mob_occupant.death(1)
	mob_occupant.ghostize()
	set_occupant(null)
	qdel(mob_occupant)
	stored_chicken_soul += 20
	desc = "This is how chicken nuggets are made boys and girls. \nAlt-Clicking will let you create eggs out of the dead bodies of chickens.\nUses 40 chicken essence per egg, grinded chickens give 20 essence. Current stored chicken essense:[stored_chicken_soul]"

/obj/machinery/chicken_grinder/AltClick(mob/user)
	. = ..()
	var/list/input_list = list()
	for(var/listed_item in grinded_types)
		var/mob/living/simple_animal/chicken/listed_chicken = new listed_item (src.loc)
		input_list += listed_chicken.egg_type
		qdel(listed_chicken)

	var/choice = input(user, "Choose an eggtype, Egg Creation") as null|anything in input_list
	if(!choice)
		return
	if(stored_chicken_soul >= 40)
		new choice (src.loc)
		stored_chicken_soul -= 40
	else
		to_chat(user, span_notice("You don't have enough chicken essence to produce an egg"))
