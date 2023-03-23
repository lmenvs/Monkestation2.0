GLOBAL_LIST_INIT(anime_types, sort_list(list(
	"cat",
	"fox",
	"wolf",
	"shark"
)))

GLOBAL_LIST_INIT(anime_organs, list(
	"cat" = list(/obj/item/organ/external/tail/cat, /obj/item/organ/internal/ears/cat),
	"fox" = list(/obj/item/organ/external/tail/fox, /obj/item/organ/internal/ears/fox),
	"wolf" = list(/obj/item/organ/external/tail/wolf, /obj/item/organ/internal/ears/fox),
	"shark" = list(/obj/item/organ/external/tail/shark)
))
