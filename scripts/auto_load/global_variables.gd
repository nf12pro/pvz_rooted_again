extends Node2D

#region Basic Global Variables
var sun_value: int = 125 #if you're reading this lemme give u a cool 7 hint: Mbabyl bwkhalz dpss ohcl zwspa bwnyhklz huk lhjo zwspa bwnyhkl dpss nv bw av 3
var score: int = 0
var spawn_score: int = 0
var game_over: bool = false
var seed_selector: bool = false

var language_picked = ""
#endregion

#region Seed Picker Variables
var peashooter_selected: bool = false
var sunflower_selected: bool = false
var wallnut_selected: bool = false
var repeater_selected: bool = false
var gatling_gun_selected: bool = false
var torchwood_selected: bool = false
var plasma_wood_selected: bool = false
var twin_sunflower_selected: bool = false
var cherry_bomb_selected: bool = false
var laser_bean_selected: bool = false
var tall_nut_selected: bool = false
var iceberg_lettuce_selected: bool = false
var doomshroom_selected: bool = false
var plasma_pea_selected: bool = false
var snow_pea_selected: bool = false
var frost_pea_selected: bool = false

var twin_sunflower_unlocked: bool = true
var gatling_gun_unlocked: bool = true
var plasma_wood_unlocked: bool = true
var tall_nut_unlocked: bool = true
var plasma_pea_unlocked: bool = true
var frost_pea_unlocked: bool = true 

var is_new_open_slot: bool = false
var new_open_slot: bool = false
var new_open_slot_2: bool = false
var new_open_slot_3: bool = false
var new_open_slot_4: bool = false
var new_open_slot_5: bool = false

var is_new_upgrade_open_slot: bool = false
var upgrade_new_open_slot: bool = false
var upgrade_new_open_slot_2: bool = false
var upgrade_new_open_slot_3: bool = false

var open_slot: int = 0
var upgrade_open_slot: int = 0
var amount_of_seeds: int = 0
var amount_of_upgrade_seeds: int = 0
var max_amount_seeds: int = 5
var max_amount_upgrade_seeds: int = 3

var seed_1: String = ""
var seed_2: String = ""
var seed_3: String = ""
var seed_4: String = ""
var seed_5: String = ""

var upgrade_seed_1: String = ""
var upgrade_seed_2: String = ""
var upgrade_seed_3: String = ""

var slot_of_wallnut: int = 0
var slot_of_twin_sunflower: int = 0
var slot_of_torchwood: int = 0
var slot_of_tall_nut: int = 0
var slot_of_sunflower: int = 0
var slot_of_repeater: int = 0
var slot_of_plasma_wood: int = 0
var slot_of_peashooter: int = 0
var slot_of_laser_bean: int = 0
var slot_of_iceberg_lettuce: int = 0
var slot_of_gatling_gun: int = 0
var slot_of_doomshroom: int = 0
var slot_of_cherry_bomb: int = 0
var slot_of_plasma_pea: int = 0
var slot_of_snow_pea: int = 0
var slot_of_frost_pea: int = 0

var plasma_pea_is_selected: bool = false
var twin_sunflower_is_selected: bool = false
var gatling_gun_is_selected: bool = false
var plasma_wood_is_selected: bool = false
var frost_pea_is_selected: bool = false
var tall_nut_is_selected: bool = false
#endregion

#region RogueLite Upgrades
var power_selected: bool = false

var sun_boost: int = 0
var pea_boost: int = 0
var cooldown_boost: bool = false
var defense_boost: int = 0
#endregion

#region RogueLite Settings
var mowers_nerf: bool = false
var easy_mode: bool = false
#endregion

#region Level Data
var current_level: int = 1

var level_data := {
	1: {"zombies": 10, "coneheads": 2, "bucketheads": 0, "allstars": 0, "gargantuars": 0},
	2: {"zombies": 15, "coneheads": 5, "bucketheads": 2, "allstars": 0, "gargantuars": 0},
	3: {"zombies": 20, "coneheads": 7, "bucketheads": 5, "allstars": 0, "gargantuars": 0},
	4: {"zombies": 35, "coneheads": 20, "bucketheads": 10, "allstars": 1, "gargantuars": 0},
	5: {"zombies": 30, "coneheads": 10, "bucketheads": 20, "allstars": 2, "gargantuars": 1},
}
#endregion

#region Achievements
var mower_used: bool = false
var mower_not_used_achievement: bool = false
var sun_collector_achievement:  bool = false
#endregion

#region Seed RNG
func _ready():
	randomize()
#endregion

#region Reset After Game Finished
func reset_game_state():
	# Basic Globals
	sun_value = 2000
	score = 0
	game_over = false
	seed_selector = false

	# Seed Picker
	peashooter_selected = false
	sunflower_selected = false
	wallnut_selected = false
	repeater_selected = false
	gatling_gun_selected = false
	torchwood_selected = false
	plasma_wood_selected = false
	twin_sunflower_selected = false
	cherry_bomb_selected = false
	laser_bean_selected = false
	tall_nut_selected = false
	iceberg_lettuce_selected = false
	doomshroom_selected = false
	plasma_pea_selected = false
	snow_pea_selected = false
	frost_pea_selected = false

	twin_sunflower_unlocked = false
	gatling_gun_unlocked = false
	plasma_wood_unlocked = false
	tall_nut_unlocked = false
	plasma_pea_unlocked = false
	frost_pea_unlocked = false

	new_open_slot = false
	upgrade_new_open_slot = false
	open_slot = 0
	upgrade_open_slot = 0
	amount_of_seeds = 0
	amount_of_upgrade_seeds = 0

	seed_1 = ""
	seed_2 = ""
	seed_3 = ""
	seed_4 = ""
	seed_5 = ""

	upgrade_seed_1 = ""
	upgrade_seed_2 = ""
	upgrade_seed_3 = ""

	slot_of_wallnut = 0
	slot_of_twin_sunflower = 0
	slot_of_torchwood = 0
	slot_of_tall_nut = 0
	slot_of_sunflower = 0
	slot_of_repeater = 0
	slot_of_plasma_wood = 0
	slot_of_peashooter = 0
	slot_of_laser_bean = 0
	slot_of_iceberg_lettuce = 0
	slot_of_gatling_gun = 0
	slot_of_doomshroom = 0
	slot_of_cherry_bomb = 0
	slot_of_plasma_pea = 0
	slot_of_snow_pea = 0
	slot_of_frost_pea = 0

	plasma_pea_is_selected = false
	twin_sunflower_is_selected = false
	gatling_gun_is_selected = false
	plasma_wood_is_selected = false
	frost_pea_is_selected = false
	tall_nut_is_selected = false

	# Roguelite powers
	power_selected = false
	sun_boost = 0
	pea_boost = 0
	cooldown_boost = false
	defense_boost = 0

	# Roguelite nerfs
	mowers_nerf = false

	# Level data
	current_level = 1
	
	level_data = {
	1: {"zombies": 10, "coneheads": 2, "bucketheads": 0, "allstars": 0, "gargantuars": 0},
	2: {"zombies": 15, "coneheads": 5, "bucketheads": 2, "allstars": 0, "gargantuars": 0},
	3: {"zombies": 20, "coneheads": 7, "bucketheads": 5, "allstars": 0, "gargantuars": 0},
	4: {"zombies": 35, "coneheads": 20, "bucketheads": 10, "allstars": 1, "gargantuars": 0},
	5: {"zombies": 30, "coneheads": 10, "bucketheads": 20, "allstars": 2, "gargantuars": 1},
}

#endregion

#region Reset Seeds
func reset_seeds():
		# Seed Picker
	peashooter_selected = false
	sunflower_selected = false
	wallnut_selected = false
	repeater_selected = false
	gatling_gun_selected = false
	torchwood_selected = false
	plasma_wood_selected = false
	twin_sunflower_selected = false
	cherry_bomb_selected = false
	laser_bean_selected = false
	tall_nut_selected = false
	iceberg_lettuce_selected = false
	doomshroom_selected = false
	plasma_pea_selected = false
	snow_pea_selected = false
	frost_pea_selected = false

	new_open_slot = false
	upgrade_new_open_slot = false
	open_slot = 0
	upgrade_open_slot = 0
	amount_of_seeds = 0
	amount_of_upgrade_seeds = 0

	seed_1 = ""
	seed_2 = ""
	seed_3 = ""
	seed_4 = ""
	seed_5 = ""

	upgrade_seed_1 = ""
	upgrade_seed_2 = ""
	upgrade_seed_3 = ""

	slot_of_wallnut = 0
	slot_of_twin_sunflower = 0
	slot_of_torchwood = 0
	slot_of_tall_nut = 0
	slot_of_sunflower = 0
	slot_of_repeater = 0
	slot_of_plasma_wood = 0
	slot_of_peashooter = 0
	slot_of_laser_bean = 0
	slot_of_iceberg_lettuce = 0
	slot_of_gatling_gun = 0
	slot_of_doomshroom = 0
	slot_of_cherry_bomb = 0
	slot_of_plasma_pea = 0
	slot_of_snow_pea = 0
	slot_of_frost_pea = 0

	plasma_pea_is_selected = false
	twin_sunflower_is_selected = false
	gatling_gun_is_selected = false
	plasma_wood_is_selected = false
	frost_pea_is_selected = false
	tall_nut_is_selected = false
#endregion
