/datum/quirk/anime
	name = "Anime"
	desc = "Your devotion to anime has led to physical body modification."
	icon = "naruto"
	value = 0
	medical_record_text = "Patient is a certified weeaboo"
	mail_goodies = list(/obj/item/clothing/glasses/blindfold, /obj/item/storage/pill_bottle/psicodine)//TODO add goodies

/datum/quirk/anime/add(client/client_source)
	var/anime_type = client_source?.prefs.read_preference(/datum/preference/choiced/anime)
	if(!anime_type)
		return
	var/list/anime_organs = GLOB.anime_organs[anime_type]
	var/mob/living/carbon/human/human_holder = quirk_holder
	for(var/obj/item/organ/organ_to_insert as anything in anime_organs)
		organ_to_insert.Insert(human_holder, special = TRUE, drop_if_replaced = FALSE)

