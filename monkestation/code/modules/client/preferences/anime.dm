/datum/preference/choiced/anime
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_key = "anime"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/anime/init_possible_values()
	return GLOB.anime_types

/datum/preference/choiced/anime/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return "Anime" in preferences.all_quirks

/datum/preference/choiced/anime/apply_to_human(mob/living/carbon/human/target, value)
	target.anime_type = value
	target.update_body_parts()

/datum/preference/choiced/anime_color/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "anime"

	return data

/datum/preference/color/anime_color
	savefile_key = "anime_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES

/datum/preference/color/anime_color/apply_to_human(mob/living/carbon/human/target, value)
	target.anime_color = value
	target.update_body_parts()
