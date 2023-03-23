GLOBAL_LIST_INIT(store_suits, generate_store_items(/datum/store_item/suit))
/*
*	WINTER COATS
*/

/datum/store_item/suit
	category = LOADOUT_ITEM_SUIT

/datum/store_item/suit/winter_coat
	name = "Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat

/datum/store_item/suit/winter_coat_greyscale
	name = "Greyscale Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/custom
/*
*	SUITS / SUIT JACKETS
*/

/datum/store_item/suit/black_suit_jacket
	name = "Black Suit Jacket"
	item_path = /obj/item/clothing/suit/toggle/lawyer/black

/datum/store_item/suit/blue_suit_jacket
	name = "Blue Suit Jacket"
	item_path = /obj/item/clothing/suit/toggle/lawyer

/datum/store_item/suit/purple_suit_jacket
	name = "Purple Suit Jacket"
	item_path = /obj/item/clothing/suit/toggle/lawyer/purple


/*
*	SUSPENDERS
*/

/datum/store_item/suit/suspenders
	name = "Recolorable Suspenders"
	item_path = /obj/item/clothing/suit/toggle/suspenders

/*
*	DRESSES
*/

/datum/store_item/suit/white_dress
	name = "White Dress"
	item_path = /obj/item/clothing/suit/costume/whitedress

/*
*	LABCOATS
*/

/datum/store_item/suit/labcoat
	name = "Labcoat"
	item_path = /obj/item/clothing/suit/toggle/labcoat

/datum/store_item/suit/labcoat_green
	name = "Green Labcoat"
	item_path = /obj/item/clothing/suit/toggle/labcoat/mad

/*
*	PONCHOS
*/

/datum/store_item/suit/poncho
	name = "Poncho"
	item_path = /obj/item/clothing/suit/costume/poncho

/datum/store_item/suit/poncho_green
	name = "Green Poncho"
	item_path = /obj/item/clothing/suit/costume/poncho/green

/datum/store_item/suit/poncho_red
	name = "Red Poncho"
	item_path = /obj/item/clothing/suit/costume/poncho/red


/*
*	JACKETS
*/

/datum/store_item/suit/bomber_jacket
	name = "Bomber Jacket"
	item_path = /obj/item/clothing/suit/jacket/bomber

/datum/store_item/suit/military_jacket
	name = "Military Jacket"
	item_path = /obj/item/clothing/suit/jacket/miljacket
	item_cost = 4000

/datum/store_item/suit/puffer_jacket
	name = "Puffer Jacket"
	item_path = /obj/item/clothing/suit/jacket/puffer

/datum/store_item/suit/puffer_vest
	name = "Puffer Vest"
	item_path = /obj/item/clothing/suit/jacket/puffer/vest
	item_cost = 6000

/datum/store_item/suit/leather_jacket
	name = "Leather Jacket"
	item_path = /obj/item/clothing/suit/jacket/leather

/datum/store_item/suit/leather_jacket/biker
	name = "Biker Jacket"
	item_path = /obj/item/clothing/suit/jacket/leather/biker
	item_cost = 2000

/datum/store_item/suit/jacket_sweater
	name = "Recolorable Sweater Jacket"
	item_path = /obj/item/clothing/suit/toggle/jacket/sweater
	item_cost = 3000

/datum/store_item/suit/jacket_oversized
	name = "Recolorable Oversized Jacket"
	item_path = /obj/item/clothing/suit/jacket/oversized
	item_cost = 3000

/datum/store_item/suit/jacket_fancy
	name = "Recolorable Fancy Fur Coat"
	item_path = /obj/item/clothing/suit/jacket/fancy
	item_cost = 3000

/datum/store_item/suit/ethereal_raincoat
	name = "Ethereal Raincoat"
	item_path = /obj/item/clothing/suit/hooded/ethereal_raincoat


/*
*	COSTUMES
*/

/datum/store_item/suit/owl
	name = "Owl Cloak"
	item_path = /obj/item/clothing/suit/toggle/owlwings
	item_cost = 7500

/datum/store_item/suit/griffin
	name = "Griffon Cloak"
	item_path = /obj/item/clothing/suit/toggle/owlwings/griffinwings
	item_cost = 7500

/datum/store_item/suit/syndi
	name = "Black And Red Space Suit Replica"
	item_path = /obj/item/clothing/suit/syndicatefake
	item_cost = 15000

/datum/store_item/suit/bee
	name = "Bee Outfit"
	item_path = /obj/item/clothing/suit/hooded/bee_costume
	item_cost = 5000

/datum/store_item/suit/plague_doctor
	name = "Plague Doctor Suit"
	item_path = /obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	item_cost = 7500

/datum/store_item/suit/snowman
	name = "Snowman Outfit"
	item_path = /obj/item/clothing/suit/costume/snowman
	item_cost = 3000

/datum/store_item/suit/chicken
	name = "Chicken Suit"
	item_path = /obj/item/clothing/suit/costume/chickensuit
	item_cost = 4000

/datum/store_item/suit/monkey
	name = "Monkey Suit"
	item_path = /obj/item/clothing/suit/costume/monkeysuit

/datum/store_item/suit/cardborg
	name = "Cardborg Suit"
	item_path = /obj/item/clothing/suit/costume/cardborg

/datum/store_item/suit/xenos
	name = "Xenos Suit"
	item_path = /obj/item/clothing/suit/costume/xenos
	item_cost = 7500

/datum/store_item/suit/ian_costume
	name = "Corgi Costume"
	item_path = /obj/item/clothing/suit/hooded/ian_costume

/datum/store_item/suit/carp_costume
	name = "Carp Costume"
	item_path = /obj/item/clothing/suit/hooded/carp_costume

/datum/store_item/suit/wizard
	name = "Wizard Robe"
	item_path = /obj/item/clothing/suit/wizrobe/fake

/datum/store_item/suit/witch
	name = "Witch Robe"
	item_path = /obj/item/clothing/suit/wizrobe/marisa/fake
	item_cost = 2000

/*
*	MISC
*/

/datum/store_item/suit/purple_apron
	name = "Purple Apron"
	item_path = /obj/item/clothing/suit/apron/purple_bartender
	item_cost = 3000

/datum/store_item/suit/denim_overalls
	name = "Denim Overalls"
	item_path = /obj/item/clothing/suit/apron/overalls

/datum/store_item/suit/ianshirt
	name = "Ian Shirt"
	item_path = /obj/item/clothing/suit/costume/ianshirt


/*
*	HAWAIIAN
*/


/datum/store_item/suit/hawaiian_shirt
	name = "Hawaiian Shirt"
	item_path = /obj/item/clothing/suit/costume/hawaiian
	item_cost = 5000


/*
*	JOB-LOCKED
*/

// WINTER COATS
/datum/store_item/suit/coat_med
	name = "Medical Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/medical

/datum/store_item/suit/coat_paramedic
	name = "Paramedic Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/medical/paramedic

/datum/store_item/suit/coat_robotics
	name = "Robotics Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/science/robotics

/datum/store_item/suit/coat_sci
	name = "Science Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/science

/datum/store_item/suit/coat_eng
	name = "Engineering Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/engineering

/datum/store_item/suit/coat_atmos
	name = "Atmospherics Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/engineering/atmos

/datum/store_item/suit/coat_hydro
	name = "Hydroponics Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/hydro

/datum/store_item/suit/coat_cargo
	name = "Cargo Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/cargo

/datum/store_item/suit/coat_miner
	name = "Mining Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat/miner

/*
*	FAMILIES
*/

/datum/store_item/suit/tmc
	name = "TMC Coat"
	item_path = /obj/item/clothing/suit/costume/tmc

/datum/store_item/suit/pg
	name = "PG Coat"
	item_path = /obj/item/clothing/suit/costume/pg

/datum/store_item/suit/deckers
	name = "Deckers Hoodie"
	item_path = /obj/item/clothing/suit/costume/deckers

/datum/store_item/suit/soviet
	name = "Soviet Coat"
	item_path = /obj/item/clothing/suit/costume/soviet

/datum/store_item/suit/yuri
	name = "Yuri Coat"
	item_path = /obj/item/clothing/suit/costume/yuri
	item_cost = 7500
