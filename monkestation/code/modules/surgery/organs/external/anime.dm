/obj/item/organ/external/cranial
	name = "cranial implant"
	desc = "you'd have to have a pretty thick skull to install one of these."

/obj/item/organ/external/cranial/cat
	name = "cat ears"
	icon = 'monkestation/icons/mob/species/quirks/anime_features.dmi'
	icon_state = "cat_ears"
//	bodypart_overlay = /datum/bodypart_overlay/mutant/cranium/cat


// /datum/bodypart_overlay/mutant/cranial/fox
// 	color_source = ORGAN_COLOR_ANIME
// 	sprite_datum = /datum/sprite_accessory/ears/human/cat

//FOX
/obj/item/organ/external/cranial/fox
	name = "fox ears"
	icon = 'monkestation/icons/mob/species/quirks/anime_features.dmi'
	icon_state = "fox_ears"
//	bodypart_overlay = /datum/bodypart_overlay/mutant/cranium/fox

// /datum/bodypart_overlay/mutant/cranial/fox
// 	color_source = ORGAN_COLOR_ANIME
// 	sprite_datum = /datum/sprite_accessory/ears/human/fox

/obj/item/organ/external/tail/fox
	name = "fox tail"
	icon = 'monkestation/icons/mob/species/quirks/anime_features.dmi'
	icon_state = "fox"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/fox
	wag_flags = WAG_ABLE


/datum/bodypart_overlay/mutant/tail/fox
	color_source = ORGAN_COLOR_ANIME
	draw_from_features = FALSE
	feature_key = "tail_human"
	sprite_datum = /datum/sprite_accessory/tails/human/fox

//WOLF
/obj/item/organ/external/tail/wolf
	name = "wolf tail"
	icon = 'monkestation/icons/mob/species/quirks/anime_features.dmi'
	icon_state = "wolf"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/wolf

/datum/bodypart_overlay/mutant/tail/wolf
	color_source = ORGAN_COLOR_ANIME
	draw_from_features = FALSE
	feature_key = "tail_human"
	sprite_datum = /datum/sprite_accessory/tails/human/wolf

//SHARK
/obj/item/organ/external/tail/shark
	name = "shark tail"
	icon = 'monkestation/icons/mob/species/quirks/anime_features.dmi'
	icon_state = "shark"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/shark
	wag_flags = WAG_ABLE

/datum/bodypart_overlay/mutant/tail/shark
	color_source = ORGAN_COLOR_ANIME
	draw_from_features = FALSE
	feature_key = "tail_human"
	sprite_datum = /datum/sprite_accessory/tails/human/shark

//XENO
/obj/item/organ/external/tail/xeno
	name = "xeno tail"
	icon = 'monkestation/icons/mob/species/quirks/anime_features.dmi'
	icon_state = "shark"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/xeno

/datum/bodypart_overlay/mutant/tail/xeno
	color_source = ORGAN_COLOR_ANIME
	draw_from_features = FALSE
	feature_key = "tail_human"
	sprite_datum = /datum/sprite_accessory/tails/human/xeno


