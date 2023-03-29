GLOBAL_LIST_INIT(anime_types, sort_list(list(
	"cat",
	"fox",
	"wolf",
	"shark"
)))

GLOBAL_LIST_INIT(anime_organs, list(
	"cat" = list(/obj/item/organ/external/tail/cat, /obj/item/organ/external/cranial/cat),
	"fox" = list(/obj/item/organ/external/tail/fox, /obj/item/organ/external/cranial/fox),
	"wolf" = list(/obj/item/organ/external/tail/wolf, /obj/item/organ/external/cranial/fox),
	"shark" = list(/obj/item/organ/external/tail/shark)
))
