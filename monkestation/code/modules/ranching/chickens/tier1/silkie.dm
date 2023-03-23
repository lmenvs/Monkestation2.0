/mob/living/simple_animal/chicken/silkie
	icon_suffix = "silkie"

	breed_name = "Selkie"
	egg_type = /obj/item/food/egg/silkie
	mutation_list = list(/datum/mutation/ranching/chicken/pigeon, /datum/mutation/ranching/chicken/cotton_candy)

	book_desc = "These behave identically to White Chickens."
/obj/item/food/egg/silkie
	name = "Selkie Egg"
	icon_state = "silkie"

	layer_hen_type = /mob/living/simple_animal/chicken/silkie
