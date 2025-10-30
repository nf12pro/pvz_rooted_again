extends Control

#region Variables

func _ready() -> void:
	randomize()
#endregion

#region Game Over Scene
func _unhandled_key_input(event: InputEvent) -> void:
	if Global.game_over == true:
		Global.sun_value = 50 
		Global.score = 0
		Global.current_level = 1
		
		Global.game_over = false
		Global.seed_selector = false
		Global.peashooter_selected = false
		Global.sunflower_selected = false
		Global.wallnut_selected = false
		Global.repeater_selected = false
		Global.gatling_gun_selected = false
		Global.torchwood_selected = false
		Global.plasma_wood_selected = false
		Global.twin_sunflower_selected = false
		Global.cherry_bomb_selected = false
		Global.iceberg_lettuce_selected = false
		Global.doomshroom_selected = false
		
		Global.new_open_slot = false
		Global.open_slot = 0
		Global.amount_of_seeds = 0
		Global.max_amount_seeds = 6
		
		Global.seed_1 = ""
		Global.seed_2 = ""
		Global.seed_3 = ""
		Global.seed_4 = ""
		Global.seed_5 = ""
		Global.seed_6 = ""
		Global.current_level = 1
		
		Global.level_data = {
	1: {"zombies": 10, "coneheads": 2, "bucketheads": 0, "allstars": 0},
	2: {"zombies": 15, "coneheads": 5, "bucketheads": 2, "allstars": 0},
	3: {"zombies": 20, "coneheads": 7, "bucketheads": 5, "allstars": 0},
	4: {"zombies": 35, "coneheads": 20, "bucketheads": 10, "allstars": 1},
	5: {"zombies": 30, "coneheads": 10, "bucketheads": 20, "allstars": 2},
}

		get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
#endregion
