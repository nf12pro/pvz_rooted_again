extends Node2D

#region Basic Global Variables
var sun_value: int = 2000 #if you're reading this lemme give u a cool 7 hint: Mbabyl bwkhalz dpss ohcl zwspa bwnyhklz huk lhjo zwspa bwnyhkl dpss nv bw av 3
var score: int = 0
var game_over: bool = false
var seed_selector: bool = false
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

var twin_sunflower_unlocked: bool = false
var gatling_gun_unlocked: bool = false
var plasma_wood_unlocked: bool = false
var tall_nut_unlocked: bool = false
var plasma_pea_unlocked: bool = false
var frost_pea_unlocked: bool = true

var new_open_slot: bool = false
var open_slot: int = 0
var amount_of_seeds: int = 0
var max_amount_seeds: int = 6

var seed_1: String = ""
var seed_2: String = ""
var seed_3: String = ""
var seed_4: String = ""
var seed_5: String = ""
var seed_6: String = ""

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
#endregion

#region Level Data
var current_level: int = 1

var level_data := {
	1: {"zombies": 10, "coneheads": 2, "bucketheads": 0, "allstars": 0},
	2: {"zombies": 15, "coneheads": 5, "bucketheads": 2, "allstars": 0},
	3: {"zombies": 20, "coneheads": 7, "bucketheads": 5, "allstars": 0},
	4: {"zombies": 35, "coneheads": 20, "bucketheads": 10, "allstars": 1},
	5: {"zombies": 30, "coneheads": 10, "bucketheads": 20, "allstars": 2},
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
