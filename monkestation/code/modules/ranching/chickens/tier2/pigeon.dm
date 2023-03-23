/mob/living/simple_animal/chicken/pigeon
	icon_suffix = "pigeon"

	breed_name_male = "Pigeon"
	breed_name_female = "Pigeon"
	egg_type = /obj/item/food/egg/pigeon

	///the radio that is inside the pigeon
	var/obj/item/radio/pigeon/egg_radio = null

	book_desc = "Message from Nano-Transen: These pigeons are totally real, and not spying devices that will listen in on your conversations for the purpose of union-busting."

/mob/living/simple_animal/chicken/pigeon/Initialize(mapload)
	. = ..()
	egg_radio = new /obj/item/radio/pigeon/egg_radio(src)

/mob/living/simple_animal/chicken/pigeon/Destroy()
	. = ..()
	egg_radio = null

/obj/item/radio/pigeon/egg_radio
	canhear_range = 0
	listening_range = 8

/obj/item/radio/pigeon/egg_radio/Initialize(mapload)
	. = ..()
	set_frequency(1477)
	set_broadcasting(TRUE)

/obj/item/food/egg/pigeon
	name = "Pigeon Egg"
	icon_state = "pigeon"

	layer_hen_type = /mob/living/simple_animal/chicken/pigeon

	///the radio inside the egg
	var/obj/item/radio/pigeon/egg_radio = null

/obj/item/food/egg/pigeon/Initialize(mapload)
	.=..()
	egg_radio = new /obj/item/radio/pigeon/egg_radio(src)

/obj/item/food/egg/pigeon/Destroy()
	. = ..()
	egg_radio = null

/obj/item/food/egg/pigeon/consumed_egg(datum/source, mob/living/eater, mob/living/feeder)
	eater.apply_status_effect(PIGEON)

/datum/status_effect/ranching/pigeon
	id = "pigeon"
	duration = 600 SECONDS

	///the radio that is put inside you
	var/obj/item/radio/pigeon/egg_radio = null

/datum/status_effect/ranching/pigeon/on_apply()
	egg_radio = new /obj/item/radio/pigeon/egg_radio(owner)
	return ..()

/datum/status_effect/ranching/pigeon/on_remove()
	egg_radio = null
